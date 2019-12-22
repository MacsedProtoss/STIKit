//
//  StringUtil.swift
//  RayPlus
//
//  Created by Macsed on 2019/11/27.
//  Copyright © 2019 Macsed. All rights reserved.
//

import Foundation

extension String {
    var localized:String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }
}
