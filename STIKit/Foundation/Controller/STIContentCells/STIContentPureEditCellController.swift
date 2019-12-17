//
//  STIContentPureEditCellController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/18.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentPureEditCellController : STIContentCellController{
    
    
    convenience init(dataManager:STIPureEditDataManager,frame:CGRect){
        self.init()
        self.dataManager = dataManager //MARK: get text from network
        getView(frame:frame)
    }
    
    override func getView(frame: CGRect) {
        cellView = STIContentPureEditCell(frame: frame, labelText: dataManager.cellInfo.name, placeholderText: "plz set".localized)
        cellView.textField.delegate = self
        let v = cellView as! STIContentPureEditCell
        v.toolBar.items![2].action = #selector(donePressed)
        v.toolBar.items![2].target = v.toolBar.items![1]
        v.textField.addTarget(self, action: #selector(textEdited(_:)), for: .editingChanged)
        
        view.addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    @objc func donePressed(){
        print("done")
        cellView.textField.endEditing(true)
        let manager = dataManager! as! STIPureEditDataManager
        manager.textData = cellView.textField.text ?? ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    @objc func textEdited(_ sender:UITextField){
        let view = cellView as! STIContentPureEditCell
        view.previewBar.text = sender.text
    }
}

