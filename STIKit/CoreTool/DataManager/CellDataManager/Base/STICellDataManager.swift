//
//  STICellDataManager.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

class STICellDataManager{
    
    var cellInfo : cellDetail!
    
    var subCellManagers : [STICellDataManager] = []
    var tableManager : STITableDataManager!
    
    init(cellInfo : cellDetail) {
        self.cellInfo = cellInfo
    }
    
    func update(){
        
        if cellInfo.subCellDetails == nil {
            tableManager.parentCellManager?.update()
            return
        }
        
        cellInfo.subCellDetails = []
        for manager in subCellManagers {
            cellInfo.subCellDetails?.append(manager.cellInfo)
        }
        
        tableManager.parentCellManager?.update()
        
        
    }
    
    
}
