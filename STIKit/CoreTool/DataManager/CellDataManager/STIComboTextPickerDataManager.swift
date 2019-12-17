//
//  STIComboTextPickerDataManager.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

class STIComboTextPickerDataManager: STICellDataManager {
    
    var selectedIndexs : Set<Int> = []
    var diyText : String? = nil
    
    convenience init(cellInfo : cellDetail, indexs : Set<Int>?) {
        self.init(cellInfo : cellInfo)
        self.selectedIndexs = indexs ?? []
    }
    
}
