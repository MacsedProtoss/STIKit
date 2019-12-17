//
//  STITextPickerDataManager.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

class STITextPickerDataManager: STICellDataManager {
    
    var selectIndex : Int = 0
    var diyText : String? = nil
    
    convenience init(cellInfo : cellDetail, index : Int?) {
        self.init(cellInfo : cellInfo)
        self.selectIndex = index ?? 0
    }
    
    
}
