//
//  STIScrollContentDetailViewController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIScrollContentDetailViewController : UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var tableManager : STITableDataManager!
    
    var table : STIScrollContentDetailView!
    
    var contentHeight : CGFloat = 0
    
    var parentSwitchCellController : STIContentSwitchCellController? = nil
    var subCellControllers : [STIContentCellController] = []
    
    convenience init(cellDataManagers : [STICellDataManager]){
        self.init()
        tableManager = STITableDataManager(tableInfo: cellDataManagers)
        table = getTable()
        contentHeight = getContentHeight()
    }
    
    func getTable() -> STIScrollContentDetailView{
        let t = STIScrollContentDetailView()
        t.contentTable.delegate = self
        t.contentTable.dataSource = self
        t.contentTable.register(STIScrollContentCell.classForCoder(), forCellReuseIdentifier: "dataPickerCell")
        view.addSubview(t)
        t.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        return t
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableManager.subCellManagers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detail = tableManager.subCellManagers[indexPath.row].cellInfo!
        let cell = STIScrollContentCell(style: .default, reuseIdentifier: "dataPickerCell")
        
        switch detail.type {
        case is STIContentDatePickerCell.Type:
            let controller = STIContentDatePickerCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
            
            cell.setContent(view:controller.view)
            self.subCellControllers.append(controller)
            controller.dataManager.tableManager = tableManager
            
            if parentSwitchCellController != nil {
                parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
            }
            
            break
        case is STIContentComboTextPickerCell.Type:
            
            let controller = STIContentComboTextPickerCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
            
            cell.setContent(view:controller.view)
            self.subCellControllers.append(controller)
            controller.dataManager.tableManager = tableManager
            
            if parentSwitchCellController != nil {
                parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
            }
            
            break
        case is STIContentTextPickerCell.Type:
            let controller = STIContentTextPickerCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
            
            cell.setContent(view:controller.view)
            self.subCellControllers.append(controller)
            controller.dataManager.tableManager = tableManager
            
            if parentSwitchCellController != nil {
                parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
            }
            
            break
        case is STIContentPureEditCell.Type:
            let controller = STIContentPureEditCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
            
            cell.setContent(view:controller.view)
            self.subCellControllers.append(controller)
            controller.dataManager.tableManager = tableManager
            
            if parentSwitchCellController != nil {
                parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
            }
            
            break
        case is STIContentSwitchCell.Type:
            let controller = STIContentSwitchCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
            
            cell.setContent(view:controller.view)
            self.subCellControllers.append(controller)
            controller.dataManager.tableManager = tableManager
            
            
            controller.parentTable = self
            
            if parentSwitchCellController != nil {
                parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
            }
            
            break
        default:
            let view = UIView()
            cell.setContent(view: view)
            fatalError("other cell type is not acceptable")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detail = tableManager.subCellManagers[indexPath.row].cellInfo!
        if detail.type is STIContentSwitchCell.Type {
            return
        }
        
        //MARK: register a new cell
        let controller = subCellControllers[indexPath.row]
        controller.cellView.textField.becomeFirstResponder()
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let detail = tableManager.subCellManagers[indexPath.row].cellInfo!
        
        print("===")
        let output = getHeight(cellDetail: detail)
    
        print(detail.name)
        print(detail.isEnabled)
        
        
        print(output)
        print("-------")
        return output
    }
    
    private func getContentHeight() -> CGFloat{
        var output = CGFloat(0)
        for cellManager in tableManager.subCellManagers {
            output += getHeight(cellDetail: cellManager.cellInfo)
        }
        return output
    }
    
    private func getHeight(cellDetail:cellDetail) -> CGFloat{
        
        print(cellDetail.subCellDetails)
        
        if cellDetail.type is STIContentSwitchCell.Type {
            if cellDetail.isEnabled! {
                if cellDetail.subCellDetails != nil {
                    
                    var output = CGFloat(44)
                    
                    for subdetail in cellDetail.subCellDetails!{
                        if subdetail.type is STIContentSwitchCell.Type {
                            output += getHeight(cellDetail: subdetail)
                        }else{
                            output += 44
                        }
                    }
                    
                    return output
                }else{
                    return CGFloat(44)
                }
            }else{
                return CGFloat(44)
            }
        }else{
            return CGFloat(44)
        }
        
        
    }
    
    func reloadAllData() {
        
        contentHeight = getContentHeight()
        table.contentTable.beginUpdates()
        table.contentTable.endUpdates()
        if parentSwitchCellController != nil {
            parentSwitchCellController!.parentTable?.reloadAllData()
        }
    }
    
    func disableAllInput(){
        for cellController in subCellControllers {
            if cellController is STIContentSwitchCellController{
                let c = cellController as! STIContentSwitchCellController
                c.contentTableController?.disableAllInput()
            }else{
                cellController.cellView.textField.resignFirstResponder()
            }
        }
    }
    
    
}

