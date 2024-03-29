//
//  STIFloatingBtnView.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIFloatingBtnView : UIView {
    
    var btn : UIButton? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        btn = getAddBtn()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getAddBtn() -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage.init(named: "addBtn")?.reSetSize(to: CGSize(width: 60, height: 60)).withRenderingMode(.alwaysOriginal), for: .normal)
        self.addSubview(btn)
        btn.snp.makeConstraints{(make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        btn.layer.shadowColor = UIColor(red: 0.78, green: 0.81, blue: 0.88, alpha: 1).cgColor
        btn.layer.shadowOffset = CGSize(width: 1.5, height: 2.0)
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 3
        return btn
    }
    
    
}

