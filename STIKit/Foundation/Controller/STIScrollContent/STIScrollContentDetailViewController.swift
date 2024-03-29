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
    var firstTimeLoad : Bool = true
    
    var contentHeight : CGFloat = 0 {
        didSet{
            self.table.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: contentHeight)
            self.table.contentTable.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: contentHeight)
            self.view.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: contentHeight)
        }
    }
    
    var parentSwitchCellController : STIContentSwitchCellController? = nil {
        didSet{
            if parentSwitchCellController != nil {
                self.table.contentTable.isScrollEnabled = false
                tableManager.name = parentSwitchCellController?.dataManager.cellInfo.name
            }
        }
    }
    var subCellControllers : [STIContentCellController] = []
    
    var addBtn : STIFloatingBtnView? = nil
    var mutableDataModel : STICellDataManager? = nil
    
    convenience init(cellDataManagers : [STICellDataManager]){
        self.init()
        tableManager = STITableDataManager(tableInfo: cellDataManagers)
        table = getTable()
        contentHeight = getContentHeight()
    }
    
    func enableAddBtn(cellDatamanager : STICellDataManager){
        addBtn = STIFloatingBtnView()
        view.addSubview(addBtn!)
        addBtn!.snp.makeConstraints{(make) in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.height.equalTo(60)
        }
        
        mutableDataModel = cellDatamanager
        
        addBtn!.btn?.addTarget(self, action: #selector(addPressed(_:)), for: .touchUpInside)
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
            
            if firstTimeLoad {
                let controller = STIContentDatePickerCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
                
                cell.setContent(view:controller.view)
                self.subCellControllers.append(controller)
                controller.dataManager.tableManager = tableManager
                
                if parentSwitchCellController != nil {
                    parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
                }
            }else{
                cell.setContent(view:subCellControllers[indexPath.row].view)
            }
            
            break
        case is STIContentComboTextPickerCell.Type:
            
            if firstTimeLoad {
                let manager = tableManager.subCellManagers[indexPath.row] as! STIComboTextPickerDataManager
                
                let controller = STIContentComboTextPickerCellController(dataManager:manager,frame:CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
                
                cell.setContent(view:controller.view)
                self.subCellControllers.append(controller)
                controller.dataManager.tableManager = tableManager
                
                if parentSwitchCellController != nil {
                    parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
                }
            }else{
                cell.setContent(view:subCellControllers[indexPath.row].view)
            }
            
            
            
            break
        case is STIContentTextPickerCell.Type:
            
            if firstTimeLoad {
                let controller = STIContentTextPickerCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
                
                cell.setContent(view:controller.view)
                self.subCellControllers.append(controller)
                controller.dataManager.tableManager = tableManager
                
                if parentSwitchCellController != nil {
                    parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
                }
            }else{
                cell.setContent(view:subCellControllers[indexPath.row].view)
            }
            
            
            
            break
        case is STIContentPureEditCell.Type:
            
            if firstTimeLoad {
                let controller = STIContentPureEditCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
                
                cell.setContent(view:controller.view)
                self.subCellControllers.append(controller)
                controller.dataManager.tableManager = tableManager
                
                if parentSwitchCellController != nil {
                    parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
                }
            }else{
                cell.setContent(view:subCellControllers[indexPath.row].view)
            }
            
            
            
            break
            
        case is STIContentTitlePickerCell.Type:
            
            if firstTimeLoad {
                let controller = STIContentTitlePickerController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
             
                cell.setContent(view:controller.view)
                self.subCellControllers.append(controller)
                controller.dataManager.tableManager = tableManager
             
             
                controller.parentTable = self
             
             
                if parentSwitchCellController != nil { parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
                }
            }else{
                cell.setContent(view:subCellControllers[indexPath.row].view)
            }
            break
            
        case is STIContentTitleCell.Type:
            
            if firstTimeLoad {
                let controller = STIContentTitleCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
                
                cell.setContent(view:controller.view)
                self.subCellControllers.append(controller)
                controller.dataManager.tableManager = tableManager
                
                
                controller.parentTable = self
                
                
               if parentSwitchCellController != nil { parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
                }
                
            }else{
                cell.setContent(view:subCellControllers[indexPath.row].view)
            }
            
            
            break
            
        case is STIContentSwitchCell.Type:
            
            if firstTimeLoad {
                let controller = STIContentSwitchCellController(dataManager:tableManager.subCellManagers[indexPath.row],frame:CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
                
                cell.setContent(view:controller.view)
                self.subCellControllers.append(controller)
                controller.dataManager.tableManager = tableManager
                
                
                controller.parentTable = self
                
                if parentSwitchCellController != nil {
                    parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
                }
            }else{
                cell.setContent(view:subCellControllers[indexPath.row].view)
            }
            
            
            
            break
            
        case is STIContentPopCell.Type:
            
            if firstTimeLoad {
                let controller = STIContentPopCellController(dataManager: tableManager.subCellManagers[indexPath.row], frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
                
                cell.setContent(view: controller.view)
                self.subCellControllers.append(controller)
                controller.dataManager.tableManager = tableManager
                
                if parentSwitchCellController != nil {
                    parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
                }
            }else{
                cell.setContent(view:subCellControllers[indexPath.row].view)
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
        
        if detail.type is STIContentPopCell.Type {
            
            let controller = STIPopUpViewController(name:detail.name,dataManagers:STICellDataToManagerConverter.shared.getCellManagers(details: detail.subCellDetails!))
            
            controller.contentTableController.tableManager.name = detail.name
            
            self.present(controller,animated: true)
            
            return
        }
        
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
    
    func getContentHeight() -> CGFloat{
        var output = CGFloat(0)
        for cellManager in tableManager.subCellManagers {
            
            output += getHeight(cellDetail: cellManager.cellInfo)
            
        }
        print("\(tableManager.name)'s contentHeight is \(output)")
        
        return output
    }
    
    private func getHeight(cellDetail:cellDetail) -> CGFloat{
        
        print(cellDetail.subCellDetails)
        
        if cellDetail.type is STIContentTitlePickerCell.Type{
            
            var output = CGFloat(44)
            
            for subDetail in cellDetail.subTableDetails![cellDetail.subTableSelectedIndex!]{
                
                output += getHeight(cellDetail: subDetail)
                
            }
            
            return output
            
        }else if cellDetail.type is STIContentTitleCell.Type{
            var output = CGFloat(44)
            
            for subdetail in cellDetail.subCellDetails!{
                if subdetail.type is STIContentSwitchCell.Type {
                    output += getHeight(cellDetail: subdetail)
                }else{
                    output += 44
                }
            }
            
            return output
        
        }else if cellDetail.type is STIContentSwitchCell.Type {
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
        
        print("\(parentSwitchCellController?.dataManager.cellInfo.name ?? "root") 's contentHeight:\(contentHeight)")
        
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
    
    @objc func addPressed(_ sender: UIButton){
        
        let newManager = STIPopDataManager(cellInfo: mutableDataModel!.cellInfo)
        newManager.cellInfo.name = tableManager.name + String(tableManager.subCellManagers.count + 1)
        
        tableManager.subCellManagers.append(newManager)
        
        
        let controller = STIContentPopCellController(dataManager: newManager, frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        
        self.subCellControllers.append(controller)
        controller.dataManager.tableManager = tableManager
        
        if parentSwitchCellController != nil {
            parentSwitchCellController!.dataManager.subCellManagers.append(controller.dataManager)
        }
        
        table.contentTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firstTimeLoad = false
    }
    
    
}

