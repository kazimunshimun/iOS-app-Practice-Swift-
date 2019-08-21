//
//  GradiantView.swift
//  Plexus
//
//  Created by Anik on 16/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    var startPointValue: CGPoint = CGPoint(x: 0, y: 0)
    var endPointValue: CGPoint = CGPoint(x: 1, y: 1)
    var startColorValue: CGColor = UIColor.white.cgColor
    
    @IBInspectable public var startPoint: CGPoint {
        get {
            return startPointValue
        }
        set {
            startPointValue = newValue
            updateGrediant()
        }
    }
    
    @IBInspectable public var endPoint: CGPoint {
        get {
            return endPointValue
        }
        set {
            endPointValue = newValue
            updateGrediant()
        }
    }
    
    func updateGrediant() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        
        gradientLayer.colors = [ColorUtils.hexStringToUIColor(hex: "13131D").cgColor,
                                ColorUtils.hexStringToUIColor(hex: "232A4E").cgColor,
                                ColorUtils.hexStringToUIColor(hex: "232A4E").cgColor,
                                ColorUtils.hexStringToUIColor(hex: "13131D").cgColor]
        
       // gradientLayer.colors = [ColorUtils.hexStringToUIColor(hex: "3F5CC8").cgColor,
       //                         ColorUtils.hexStringToUIColor(hex: "E12160").cgColor]
        gradientLayer.startPoint = startPointValue
        gradientLayer.endPoint = endPoint
        self.layer.addSublayer(gradientLayer)
    }
    
    static func getGradientLayer (_ firstColor: String, _ lastColor: String, _ frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        //print("x: \(frame.origin.x) y: \(frame.origin.y)")
        //print("w: \(frame.width) h: \(frame.height)")
        gradientLayer.colors = [ColorUtils.hexStringToUIColor(hex: firstColor).cgColor,
                                ColorUtils.hexStringToUIColor(hex: lastColor).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        return gradientLayer
    }
    
}
