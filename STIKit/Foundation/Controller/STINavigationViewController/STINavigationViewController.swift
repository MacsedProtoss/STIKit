//
//  STINavigationViewController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STINavigationViewController : UIViewController {
    
    var viewTitle : String = "" {
        didSet{
            navBar?.titleLabel?.text = viewTitle.localized
        }
    }
    
    var leftBtnTitle : String = "" {
        didSet{
            navBar?.leftBtn?.setTitle(leftBtnTitle.localized, for: .normal)
            if leftBtnTitle == "back" {
                navBar?.leftBtn?.isHidden = false
                navBar?.leftBtn?.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
                navBar?.leftBtn?.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            }else{
                navBar?.leftBtn?.isHidden = true
            }
        }
    }
    
    var rightBtnTitle : String = "" {
        didSet{
            navBar?.rightBtn?.setTitle(rightBtnTitle.localized, for: .normal)
            if rightBtnTitle == "save" {
                navBar?.rightBtn?.isHidden = false
                navBar?.rightBtn?.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
                navBar?.rightBtn?.setImage(UIImage(systemName: "tray.full"), for: .normal)
            }else if rightBtnTitle == "delete" {
                navBar?.rightBtn?.isHidden = false
                navBar?.rightBtn?.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
                navBar?.rightBtn?.setImage(UIImage(systemName: "trash"), for: .normal)
            }else{
                navBar?.rightBtn?.isHidden = true
            }
        }
    }
    
    func getNavBar(needUp : Bool?) -> STINavigationBar{
        
        let barLayer = UIView()
        
        let effect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: effect)
        
        barLayer.backgroundColor = backgroundColor
        
        view.addSubview(barLayer)
        var height : CGFloat = 64
        let phoneType = PhoneType()
        
        debugPrint(phoneType.type)
        
        if phoneType.isUsingSafeArea() {
            height += 22
        }
        
        if needUp != nil {
            height -= 42
            barLayer.backgroundColor = classicBackgroundColor
        }
        
        barLayer.snp.makeConstraints{(make) in
            make.leading.trailing.equalToSuperview()
            if height == 66{
                make.top.equalToSuperview()
            }else{
                make.top.equalToSuperview()
            }
            make.height.equalTo(height)
        }
        
        effectView.frame = barLayer.frame
        barLayer.addSubview(effectView)
        
        
        let bar = STINavigationBar()
        barLayer.addSubview(bar)
        bar.snp.makeConstraints{(make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(44)
        }
        
        return bar
    }
    
    var navBar : STINavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar = getNavBar(needUp: nil)
    }
    
    @objc private func btnTapped(_ sender : UIBarButtonItem){
        self.dismiss(animated:true)
    }
    
}

