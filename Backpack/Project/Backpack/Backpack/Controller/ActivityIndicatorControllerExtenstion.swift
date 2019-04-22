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
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 115.0 / 255.0, green: 115.0 / 255.0, blue: 115.0 / 255.0, alpha: 0.7)
       // let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        let ai = CustomAcitityIndicatorView(frame: CGRect(x: 0, y: 0, width: 42, height: 42), image: UIImage(named: "spinner")!)
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
