//
//  Color.swift
//  Baby Biography
//
//  Created by Yeshua Lagac on 14/09/2018.
//  Copyright © 2018 Yeshua Lagac. All rights reserved.
//

import UIKit

class Color {
    
    public static let navColor = hexStringToUIColor(hex: "#42D5FF")
    public static let yellowColor = hexStringToUIColor(hex: "#FFCE00")
    
    public static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
