//
//  RoundedButton.swift
//  Navigo
//
//  Created by Anik on 2/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit
class RoundedButton: UIButton {
    @IBInspectable public var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
}
