//
//  ActivityIndicatorControllerExtenstion.swift
//  Backpack
//
//  Created by Anik on 22/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView, showText: Bool, text: String?, position: AcitvityIndicatorPosition) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        
       // let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        let ai = CustomAcitityIndicatorView(frame: onView.frame, image: UIImage(named: "spinner")!, isWithText: showText, text: text, position: position)
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
            ai.startAnimating()
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
