//
//  RoundedCornersShadowView.swift
//  Plexus
//
//  Created by Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedCornersShadowView: UIView {
    
    var shadowAdded: Bool = false
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded { return }
        shadowAdded = true
        
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = ColorUtils.hexStringToUIColor(hex: "13131D").cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = CGSize(width: 0.0, height: 8.0)
        shadowLayer.layer.shadowOpacity = 0.4
        shadowLayer.layer.shadowRadius = 3
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        
        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubviewToFront(self)
    }
    
}

