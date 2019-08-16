//
//  ColorUtils.swift
//  Plexus
//
//  Created by Anik on 16/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

public class ColorUtils {
    
    static func hexStringToUIColor (hex:String) -> UIColor {
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
    
    static func colorRGB (_ redColor: Float, _ greenColor: Float, _ blueColor: Float) -> UIColor {
        return UIColor(
            red: CGFloat(redColor / 255.0),
            green: CGFloat(greenColor / 255.0),
            blue: CGFloat(blueColor / 255.0),
            alpha: CGFloat(1.0)
        )
    }
    
}
