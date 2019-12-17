//
//  STIContentComboTextPickerCellController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentComboTextPickerCellController : STIContentCellController,UIPickerViewDelegate,UIPickerViewDataSource {

    private var checkedList : Dictionary<String,Bool> = [:]
    private var otherDetail : String = ""
    
    convenience init(dataManager:STIComboTextPickerDataManager,frame:CGRect){
        self.init()
        self.dataManager = dataManager //MARK: get indexs from network
        getView(frame:frame)
        
        for item in dataManager.cellInfo.sections! {
            checkedList[item] = false
        }
    }
    
    override func getView(frame: CGRect) {
        cellView = STIContentComboTextPickerCell(frame: frame, labelText: dataManager.cellInfo.name, placeholderText: "plz set".localized, sections: dataManager.cellInfo.sections!)
        cellView.textField.delegate = self
        let v = cellView as! STIContentComboTextPickerCell
        v.picker.delegate = self
        v.picker.dataSource = self
        v.toolBar.items![0].action = #selector(selectPressed)
        v.toolBar.items![0].target = v.toolBar.items![0]
        v.toolBar.items![2].action = #selector(donePressed)
        v.toolBar.items![2].target = v.toolBar.items![2]
        
        view.addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    @objc func donePressed(){
        print("done")
        cellView.textField.endEditing(true)
    }
    
    @objc func selectPressed(){
        let view = cellView as! STIContentComboTextPickerCell
        let key = dataManager.cellInfo.sections![(view.picker.selectedRow(inComponent: 0))]
        if checkedList[key]! {
            checkedList[key] = false
            view.toolBar.items?.first?.title = "select".localized
        }else{
            checkedList[key] = true
            view.toolBar.items?.first?.title = "deselect".localized
            if key == "other".localized {
                let alert = UIAlertController(title: "plz fill Detail".localized, message: "", preferredStyle: .alert)
                alert.addTextField { (text) in
                    text.placeholder = "detail".localized
                }
                let OKAction = UIAlertAction(title: "confirm".localized, style: .default) { (action) in
                    self.otherDetail = alert.textFields?.first?.text ?? ""
                    let manager = self.dataManager as! STITextPickerDataManager
                    manager.diyText = alert.textFields?.first?.text
                }
                let cancelAction = UIAlertAction(title: "cancel".localized, style: .cancel) { (action) in
                    let manager = self.dataManager as! STITextPickerDataManager
                    manager.diyText = nil
                }
                
                alert.addAction(cancelAction)
                alert.addAction(OKAction)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        view.picker.reloadAllComponents()
        
        var output = ""
        for item in dataManager.cellInfo.sections! {
            if checkedList[item]! {
                output += item
                output += ","
            }
        }
        
        if otherDetail == "" {
            if let _ = checkedList["other"]{
                checkedList["other"] = false
            }
        }else{
            output += otherDetail
            output += ","
        }
        
        output.removeLast()
        view.textField.text = output
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let view = cellView as! STIContentComboTextPickerCell
        
        if checkedList[dataManager.cellInfo.sections![row]]! {
            view.toolBar.items?.first?.title = "deselect".localized
        }else{
            view.toolBar.items?.first?.title = "select".localized
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let manager = dataManager as! STIComboTextPickerDataManager
        
        if checkedList[dataManager.cellInfo.sections![row]]! {
            manager.selectedIndexs.insert(row)
            return dataManager.cellInfo.sections![row]+" ✔️"
        }else{
            manager.selectedIndexs.remove(row)
            return dataManager.cellInfo.sections![row]
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataManager.cellInfo.sections!.count
    }
    
}

