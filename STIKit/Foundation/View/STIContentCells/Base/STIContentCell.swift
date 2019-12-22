//
//  STIContentCell.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentCell: UIView {
    
    var textField : UITextField!
    var label : UILabel!
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    convenience init(frame:CGRect,labelText:String,placeholderText:String){
        self.init(frame:frame)
        label = getLabel(labelText: labelText)
        textField = getInputView(placeholderText: placeholderText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getInputView(placeholderText:String) -> UITextField{
        let view = UITextField()
        self.addSubview(view)
        view.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-22)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(20)
        }
        view.textAlignment = .right
        view.placeholder = placeholderText=="" ? "plz set".localized : placeholderText
        view.textColor = UIColor.systemGray
        return view
    }
    
    func getLabel(labelText:String) -> UILabel{
        let view = UILabel()
        self.addSubview(view)
        view.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(22)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(20)
        }
        view.text = labelText
        view.textColor = textMarkColor
        return view
    }
    
}

