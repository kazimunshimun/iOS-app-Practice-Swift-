//
//  GuestCountViewControllerExtension.swift
//  SocialMeetUp
//
//  Created by Anik on 29/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

var guestCountView : UIView?

extension UIViewController {
    func showCountDialog(onView : UIView) {
        let countView = UIView.init(frame: onView.bounds)
       // countView.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        countView.addSubview(blurEffectView)
        
        // let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        let cv = GuestCountView(frame: onView.bounds)
        cv.center = countView.center
        countView.addSubview(cv)
        onView.addSubview(countView)
        guestCountView = countView
        
        //ai.okButton.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
    }
    
    func removeErrorDialog() {
        DispatchQueue.main.async {
            guestCountView?.removeFromSuperview()
            guestCountView = nil
        }
    }
    
    @objc func pressed(sender: UIButton!) {
        removeErrorDialog()
    }
}
