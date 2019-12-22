//
//  STITableDataManager.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

class STITableDataManager{
    
    var subCellManagers : [STICellDataManager] = []
    var parentCellManager : STICellDataManager? = nil
    var pageManager : STIPageDataManager? = nil
    
    init(tableInfo : [STICellDataManager]) {
        self.subCellManagers = tableInfo
    }
    
    var name : String!
    
    
}
