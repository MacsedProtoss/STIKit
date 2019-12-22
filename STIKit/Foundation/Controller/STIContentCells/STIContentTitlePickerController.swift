//
//  STIContentTitlePickerController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentTitlePickerController : STIContentTitleCellController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var subTableControllers : [STIScrollContentDetailViewController] = []
    
    convenience init(dataManager : STICellDataManager,frame:CGRect){
        self.init()
        self.dataManager = dataManager
        
        
        var index = 0
        for subTable in dataManager.cellInfo.subTableDetails! {
            
            let controller = STIScrollContentDetailViewController(cellDataManagers: STICellDataToManagerConverter.shared.getCellManagers(details: subTable))
            
            controller.parentSwitchCellController = self
            controller.tableManager.parentCellManager = self.dataManager
            
            subTableControllers.append(controller)
            
            
            controller.tableManager.name = dataManager.cellInfo.sections![index]
            index += 1
        }
        
        getView(frame:frame)
        
    }
    
    override func getView(frame: CGRect) {
        cellView = STIContentTitlePickerCell(frame: frame, labelText: dataManager.cellInfo.name,placeholderText: dataManager.cellInfo.sections![0].localized)
        
        cellView.textField.delegate = self
        let v = cellView as! STIContentTitlePickerCell
        v.picker.delegate = self
        v.picker.dataSource = self
        v.toolBar.items![1] = UIBarButtonItem(title: "done".localized, style: .done, target: self, action: #selector(donePressed))
        
        
        
        contentTableController = subTableControllers[0]
        
        v.setTable(view: contentTableController!.view, height: contentTableController!.contentHeight)
        
        view.addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
    }
    
    override func updateHeight(){
        
        var newHeight : CGFloat = 44
        newHeight += contentTableController!.contentHeight
        
        print("\(dataManager.cellInfo.name) 's cellHeight: \(newHeight)")
        
        view.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: newHeight)
        
        let v = cellView as! STIContentTitlePickerCell
        v.updateTableHeight(height:newHeight-44)
        
        parentTable.parentSwitchCellController?.updateHeight()
        
        if parentTable.parentSwitchCellController == nil {
            parentTable.reloadAllData()
        }
        
        
    }
    
    @objc func donePressed(){
        
        print("done")
        cellView.textField?.endEditing(true)
        let view = cellView as! STIContentTitlePickerCell
        
        let selected = view.picker.selectedRow(inComponent: 0)
        contentTableController!.view.removeFromSuperview()
        contentTableController = subTableControllers[selected]
        
        
        dataManager.cellInfo.subTableSelectedIndex = selected
        
        let v = cellView as! STIContentTitlePickerCell
        v.setTable(view: contentTableController!.view, height: contentTableController!.contentHeight)
        
        
        dataManager.update()
        updateHeight()
        contentTableController!.reloadAllData()
        
        
        
        
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
        let manager = dataManager as! STITitlePickerDataManager
        manager.selectIndex = row
    }
    
    
}

