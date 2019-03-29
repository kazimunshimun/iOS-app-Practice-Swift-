//
//  TextInsetTextField.swift
//  Backpack
//
//  Created by Anik on 29/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

@IBDesignable
class TextInsetTextField: UITextField {
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0
    
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
