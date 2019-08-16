//
//  RoundedButton.swift
//  Backpack
//
//  Created by Anik on 17/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    var shadowAdded: Bool = false
    @IBInspectable public var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
