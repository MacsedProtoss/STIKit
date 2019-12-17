//
//  STIPureEditDataManager.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

class STIPureEditDataManager: STICellDataManager {
    
    var textData : String = ""
    
    convenience init(cellInfo : cellDetail, text : String?) {
        self.init(cellInfo : cellInfo)
        self.textData = text ?? ""
    }
    
}
