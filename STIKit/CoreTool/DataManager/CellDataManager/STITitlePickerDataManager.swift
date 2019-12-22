//
//  STITitlePickerDataManager.swift
//  RayPlus
//
//  Created by Macsed on 2019/12/21.
//  Copyright © 2019 Macsed. All rights reserved.
//

import Foundation

class STITitlePickerDataManager : STICellDataManager {
    
    var selectIndex = 0 {
        didSet{
            cellInfo.subTableSelectedIndex = selectIndex
        }
    }
    
}
