//
//  WaitViewControllerExtension.swift
//  Plexus
//
//  Created by Anik on 30/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

var vSpinner : UIView?

extension UIViewController {
    func showWaitView(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor(red: 36/255.0, green: 45/255.0, blue: 76/255.0, alpha: 1.0)
        
        // let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        let ai = WaitView(frame: onView.frame, image: UIImage(named: "logo")!)
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
            ai.startAnimating()
        }
        
        vSpinner = spinnerView
    }
    
    func removeWaitView() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
