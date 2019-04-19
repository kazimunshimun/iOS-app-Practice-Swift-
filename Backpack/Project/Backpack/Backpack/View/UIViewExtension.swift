//
//  UIViewExtension.swift
//  Backpack
//
//  Created by Anik on 19/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

extension UIView {
    func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
}
