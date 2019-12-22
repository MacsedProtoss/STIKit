//
//  UIUtils.swift
//  RayPlus
//
//  Created by Macsed on 2019/11/27.
//  Copyright © 2019 Macsed. All rights reserved.
//

import UIKit

let screenSize = UIScreen.main.bounds

extension UIImage{
    func reSetSize(to size:CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let reSizeImage:UIImage? = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return reSizeImage!
    }
}

extension UIColor{
    func getHexColor(hexValue: UInt64,alphaValue : CGFloat) -> UIColor {
        let red = CGFloat(Double((hexValue & 0xFF0000)>>16)/255.0)
        let green = CGFloat(Double((hexValue & 0x00FF00)>>8)/255.0)
        let blue = CGFloat(Double(hexValue & 0x0000FF)/255.0)
        let color = UIColor(red: red, green: green, blue: blue, alpha: alphaValue)
        return color
    }
    
    func resetAlpha(to alpha: CGFloat) -> UIColor{
        let red = self.cgColor.components?[0] ?? 1
        let green = self.cgColor.components?[1] ?? 1
        let blue = self.cgColor.components?[2] ?? 1
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}



