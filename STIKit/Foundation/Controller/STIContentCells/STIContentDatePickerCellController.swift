//
//  STIContentDatePickerCellController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/18.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentDatePickerCellController: STIContentCellController{
    
    convenience init(dataManager:STIDatePickerDataManager,frame:CGRect){
        self.init()
        self.dataManager = dataManager //MARK: get date from network
        getView(frame:frame)
    }
    
    override func getView(frame: CGRect) {
        cellView = STIContentDatePickerCell(frame:frame,labelText: dataManager.cellInfo.name, placeholderText: "plz set".localized)
        cellView.textField.delegate = self
        let v = cellView as! STIContentDatePickerCell
        v.picker.addTarget(self,action: #selector(dateChanged),for:.valueChanged)
        
        view.addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    @objc func dateChanged(){
        let formatter = DateFormatter()
        let view = cellView as! STIContentDatePickerCell
        
        formatter.dateFormat = "yyyy-MM-dd".localized
        cellView.textField.text = formatter.string(from: view.picker.date)
        let manager = dataManager! as! STIDatePickerDataManager
        manager.dateData = view.picker!.date
    }
    
    
}

