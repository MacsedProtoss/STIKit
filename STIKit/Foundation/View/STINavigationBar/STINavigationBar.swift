//
//  STINavigationBar.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STINavigationBar: UIView {
    
    private func getLeftBtn() -> UIButton{
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(btn)
        btn.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(11)
            make.height.equalTo(20)
            make.width.equalTo(75)
        }
        return btn
    }
    
    private func getRightBtn() -> UIButton {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(btn)
        btn.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-11)
            make.height.equalTo(20)
            make.width.equalTo(75)
        }
        return btn
    }
    
    private func getTitleLabel() -> UILabel {
        let label = UILabel()
        self.addSubview(label)
        label.snp.makeConstraints{(make) in
            make.center.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }
    
    var leftBtn : UIButton?
    var rightBtn : UIButton?
    var titleLabel : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftBtn = getLeftBtn()
        rightBtn = getRightBtn()
        titleLabel = getTitleLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

