//
//  BottomLineTextField.swift
//  Backpack
//
//  Created by Anik on 16/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class BottomLineTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        
        borderLine.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#FFFFFF")
        borderLine.alpha = 0.2
        self.addSubview(borderLine)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
