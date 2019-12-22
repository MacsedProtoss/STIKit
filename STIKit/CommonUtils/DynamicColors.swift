//
//  DynamicColors.swift
//  RayPlus
//
//  Created by Macsed on 2019/11/27.
//  Copyright © 2019 Macsed. All rights reserved.
//

import UIKit

let backgroundColor = UIColor { (trainCollection) -> UIColor in
    if trainCollection.userInterfaceStyle == .dark {
        return UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
    } else {
        return UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.75)
    }
}

let textMarkColor = UIColor { (trainCollection) -> UIColor in
    if trainCollection.userInterfaceStyle == .dark {
        return UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
    } else {
        return UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

let classicBackgroundColor = UIColor { (trainCollection) -> UIColor in
    if trainCollection.userInterfaceStyle == .dark {
        return UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
    } else {
        return UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
