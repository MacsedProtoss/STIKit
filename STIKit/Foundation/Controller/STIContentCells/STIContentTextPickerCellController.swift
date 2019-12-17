//
//  STIContentTextPickerCellController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/18.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentTextPickerCellController : STIContentCellController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    convenience init(dataManager:STITextPickerDataManager,frame:CGRect){
        self.init()
        self.dataManager = dataManager //MARK: get index from network
        getView(frame:frame)
    }
    
    override func getView(frame: CGRect) {
        cellView = STIContentTextPickerCell(frame: frame, labelText: dataManager.cellInfo.name, placeholderText: "plz set".localized)
        cellView.textField.delegate = self
        let v = cellView as! STIContentTextPickerCell
        v.picker.delegate = self
        v.picker.dataSource = self
        v.toolBar.items![1].action = #selector(donePressed)
        v.toolBar.items![1].target = v.toolBar.items![1]
        
        view.addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    @objc func donePressed(){
        print("done")
        cellView.textField?.endEditing(true)
        let view = cellView as! STIContentTextPickerCell
        
        if dataManager.cellInfo.sections![view.picker.selectedRow(inComponent: 0)] == "other".localized {
            let alert = UIAlertController(title: "plz fill Detail".localized, message: "", preferredStyle: .alert)
            alert.addTextField { (text) in
                text.placeholder = "detail".localized
            }
            let OKAction = UIAlertAction(title: "confirm".localized, style: .default) { (action) in
                self.cellView.textField.text = alert.textFields?.first?.text ?? ""
                let manager = self.dataManager as! RPTextPickerDataManager
                manager.diyText = alert.textFields?.first?.text
            }
            let cancelAction = UIAlertAction(title: "cancel".localized, style: .cancel) { (action) in
                self.cellView.textField.text = ""
                let manager = self.dataManager as! RPTextPickerDataManager
                manager.diyText = nil
            }
            
            alert.addAction(cancelAction)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataManager.cellInfo.sections!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataManager.cellInfo.sections![row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cellView.textField.text = dataManager.cellInfo.sections![row]
        let manager = dataManager as! STITextPickerDataManager
        manager.selectIndex = row
    }
}
