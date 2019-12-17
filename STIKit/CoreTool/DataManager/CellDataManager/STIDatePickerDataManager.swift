//
//  STIDatePickerDataManager.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

class STIDatePickerDataManager: STICellDataManager {
    
    var dateData : Date = Date()
    
    convenience init(cellInfo : cellDetail, date:Date?) {
        self.init(cellInfo : cellInfo)
        self.dateData = date ?? Date()
    }
    
}
