//
//  GuestCountViewControllerExtension.swift
//  SocialMeetUp
//
//  Created by Anik on 29/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

var successView : UIView?

extension UIViewController {
    
    func showSuccessDialog(onView : UIView, alertInfo: AlertMessage) {
        let sView = UIView.init(frame: onView.bounds)
        // countView.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        sView.addSubview(blurEffectView)
        
        let sv = SuccessView(frame: onView.bounds, alertData: alertInfo)
        sv.center = sView.center
        sView.addSubview(sv)
        onView.addSubview(sView)
        successView = sView
        
        sv.doneButton.addTarget(self, action: #selector(doneClicked(sender:)), for: .touchUpInside)
    }
    
    func removeSuccessDialog() {
        DispatchQueue.main.async {
            successView?.removeFromSuperview()
            successView = nil
        }
    }
    
    @objc func doneClicked(sender: UIButton!) {
        removeSuccessDialog()
        dismiss(animated: true, completion: nil)
    }
    
    func showReadMoreDialog(onView : UIView, text: String) {
        let sView = UIView.init(frame: onView.bounds)
        // countView.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        sView.addSubview(blurEffectView)
        
        let sv = ReadMoreView(frame: onView.bounds, text: text)
        sv.center = sView.center
        sView.addSubview(sv)
        onView.addSubview(sView)
        successView = sView
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.removeReadMoreView))
        sView.addGestureRecognizer(gesture)
    }
    
    @objc func removeReadMoreView(sender : UITapGestureRecognizer) {
        removeSuccessDialog()
    }
}
