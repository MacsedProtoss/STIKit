//
//  STIContentTitleCellController.swift
//  STIKit
//
//  Created by Macsed on 2019/12/22.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import UIKit
import SnapKit

class STIContentTitleCellController: STIContentSwitchCellController {
    
    override func getView(frame: CGRect) {
        cellView = STIContentTitleCell(frame: frame, labelText: dataManager.cellInfo.name)
        
        contentTableController = STIScrollContentDetailViewController(cellDataManagers: STICellDataToManagerConverter.shared.getCellManagers(details: dataManager.cellInfo.subCellDetails!))
        contentTableController!.parentSwitchCellController = self
        contentTableController!.tableManager.parentCellManager = self.dataManager
        
        
        contentTableController?.tableManager.name = dataManager.cellInfo.name
        
        let v = cellView as! STIContentTitleCell
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
        
        let v = cellView as! STIContentTitleCell
        v.updateTableHeight(height:newHeight-44)
        
        parentTable.parentSwitchCellController?.updateHeight()
        
    }
    
}

