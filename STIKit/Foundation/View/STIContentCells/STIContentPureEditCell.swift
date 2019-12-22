//
//  STIContentPureEditCell.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit

class STIContentPureEditCell: STIContentCell {
     
    var toolBar : UIToolbar!
    var previewBar : UITextView!
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    convenience init(frame:CGRect,labelText:String,placeholderText:String){
        self.init(frame:frame)
        label = getLabel(labelText: labelText)
        textField = getInputView(placeholderText: placeholderText)
        toolBar = getToolBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getToolBar()->UIToolbar{
        let bar = UIToolbar()
        bar.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 40)
        let doneBtn = UIBarButtonItem(title: "done".localized, style: .done, target: nil, action: nil)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        previewBar = UITextView(frame: CGRect(x: 0, y: 10, width: 300, height: 20))
        previewBar?.backgroundColor = UIColor.clear
        previewBar?.isEditable = false
        previewBar?.textContainer.maximumNumberOfLines = 1
        let preview = UIBarButtonItem(customView: previewBar!)
        bar.items = [preview,space,doneBtn]
        
        
        textField?.inputAccessoryView = bar
        return bar
    }
    
}

