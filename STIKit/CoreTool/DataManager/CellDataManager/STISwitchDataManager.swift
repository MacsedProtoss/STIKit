//
//  STISwitchDataManager.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

class STISwitchDataManager: STICellDataManager {
    
    var isOn : Bool = false {
        didSet{
            cellInfo!.isEnabled = isOn
        }
    }
    
    convenience init(cellInfo : cellDetail, isOn : Bool?) {
        self.init(cellInfo : cellInfo)
        self.isOn = isOn ?? false
    }
    
}
