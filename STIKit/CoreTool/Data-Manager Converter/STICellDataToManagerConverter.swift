//
//  RPCellDataToManagerConverter.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

class STICellDataToManagerConverter {
    
    static let shared = STICellDataToManagerConverter()
    
    func getCellManager(detail : cellDetail) -> STICellDataManager {
        switch detail.type {
        case is STIContentDatePickerCell.Type :
            return RPDatePickerDataManager(cellInfo: detail, date: nil)
        case is RPContentComboTextPickerCell.Type :
            return RPComboTextPickerDataManager(cellInfo: detail, indexs: nil)
        case is STIContentTextPickerCell.Type :
            return RPTextPickerDataManager(cellInfo: detail, index: nil)
        case is STIContentPureEditCell.Type :
            return RPPureEditDataManager(cellInfo: detail, text: nil)
        case is STIContentSwitchCell.Type :
            return RPSwitchDataManager(cellInfo: detail, isOn: nil)
        default:
            fatalError("can't cast this type of detail")
//            return STICellDataManager(cellInfo: detail)
        }
    }
    
    func getCellManagers(details: [cellDetail]) -> [STICellDataManager] {
        var managers : [STICellDataManager] = []
        for detail in details {
            managers.append(getCellManager(detail: detail))
        }
        return managers
    }
    
    
}

