//
//  STIContentDatePickerCell.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit

class STIContentDatePickerCell: STIContentCell {
    
    var picker : UIDatePicker!
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
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
    private func getPicker() -> UIDatePicker{
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.setDate(Date(), animated: true)
        picker.maximumDate = Date()
        self.textField?.inputView = picker
        return picker
    }
    
    private func getToolBar()->UIToolbar{
        let bar = UIToolbar()
        bar.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 40)
        let doneBtn = UIBarButtonItem(title: "done".localized, style: .done, target: self, action: #selector(donePressed))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        bar.items = [space,doneBtn]
        textField?.inputAccessoryView = bar
        return bar
    }
    
    @objc func donePressed(){
        print("done")
        textField?.endEditing(true)
    }
    
    
    
}


