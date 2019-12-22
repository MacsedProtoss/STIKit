//
//  STIContentTitlePickerCell.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentTitlePickerCell: STIContentTitleCell {
    
    var picker : UIPickerView!
    var toolBar : UIToolbar!
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    convenience init(frame:CGRect,labelText:String,placeholderText:String){
        self.init(frame:frame)
        
        label = getLabel(labelText: labelText)
        textField = getInputView(placeholderText: placeholderText)
        picker = getPicker()
        toolBar = getToolBar()
    }
    
    func getPicker()->UIPickerView{
        let picker = UIPickerView()
        self.textField?.inputView = picker
        return picker
    }
    
    func getToolBar() -> UIToolbar {
        let bar = UIToolbar()
        bar.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 40)
        let doneBtn = UIBarButtonItem(title: "done".localized, style: .done, target: nil, action: nil)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        bar.items = [space,doneBtn]
        textField?.inputAccessoryView = bar
        return bar
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

