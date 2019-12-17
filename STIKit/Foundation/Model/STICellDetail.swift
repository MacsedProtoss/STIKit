//
//  STICellDetail.swift
//  STIKit
//
//  Created by Macsed on 2019/12/17.
//  Copyright © 2019 UniqueStudio.Macsed. All rights reserved.
//

import Foundation

struct cellDetail {
    var name : String
    var type : AnyClass
    var sections : [String]?
    var subCellDetails : [cellDetail]?
    var isEnabled : Bool?
}
