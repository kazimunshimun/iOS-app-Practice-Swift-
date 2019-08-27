//
//  RoundedCornerButton.swift
//  Write
//
//  Created by Anik on 27/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornerButton: UIButton {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
