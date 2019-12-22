//
//  STIContentSwitchCellController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/18.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentSwitchCellController : STIContentCellController {
    
    var parentTable : STIScrollContentDetailViewController!
    var contentTableController : STIScrollContentDetailViewController? = nil
    
    convenience init(dataManager:STISwitchDataManager,frame:CGRect){
        self.init()
        self.dataManager = dataManager //MARK: get isOn from network
        getView(frame:frame)
        
    }
    
    override func getView(frame: CGRect) {
        cellView = STIContentSwitchCell(frame: frame, labelText: dataManager.cellInfo.name, subCellDetails: dataManager.cellInfo.subCellDetails ?? [], isEnabled: dataManager.cellInfo.isEnabled ?? false)
        
        if dataManager.cellInfo.subCellDetails != nil {
            contentTableController = STIScrollContentDetailViewController(cellDataManagers: STICellDataToManagerConverter.shared.getCellManagers(details: dataManager.cellInfo.subCellDetails!))
            contentTableController!.parentSwitchCellController = self
            contentTableController!.tableManager.parentCellManager = self.dataManager
            
            contentTableController!.table.isHidden = !dataManager.cellInfo.isEnabled!
        }
        
        let v = cellView as! STIContentSwitchCell
        v.swicher.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        if contentTableController != nil {
            v.setTable(view: contentTableController!.view, height: contentTableController!.contentHeight)
            
        }
        
        view.addSubview(cellView)
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        
        
    }
    
    
    @objc func valueChanged(_ sender: UISwitch){
        
        dataManager.cellInfo.isEnabled = sender.isOn
        dataManager.update()
        print(dataManager.cellInfo.name)
        print(dataManager.cellInfo.isEnabled)
        print("******")
        
        parentTable?.reloadAllData()
        
        contentTableController?.table.isHidden = !sender.isOn
        
        updateHeight()
        
        if !sender.isOn {
            contentTableController?.disableAllInput()
        }
        
        
        
    }
    
    func updateHeight(){
        var newHeight : CGFloat = 44
        
        newHeight += contentTableController?.contentHeight ?? 0
        
        if !dataManager.cellInfo.isEnabled! {
            newHeight = 44
        }
        
        print("\(dataManager.cellInfo.name) 's cellHeight: \(newHeight)")
        
        view.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: newHeight)
        
        let v = cellView as! STIContentSwitchCell
        if v.tableView != nil {
            v.updateTableHeight(height:newHeight-44)
        }
        
        parentTable.parentSwitchCellController?.updateHeight()
        
    }
    
    
}
