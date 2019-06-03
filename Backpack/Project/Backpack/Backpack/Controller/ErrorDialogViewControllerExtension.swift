//
//  ErrorDialogViewControllerExtension.swift
//  Backpack
//
//  Created by Anik on 3/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

var errorView : UIView?

extension UIViewController {
    func showErrorDialog(onView : UIView, title: String, descriptionText: String) {
        let error = UIView.init(frame: onView.bounds)
        error.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        
        // let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        let ai = CustomAlertDialogView(frame: onView.frame, title: title, description: descriptionText)
        ai.center = error.center
        error.addSubview(ai)
        onView.addSubview(error)
        errorView = error
        
        ai.okButton.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
    }
    
    func removeErrorDialog() {
        DispatchQueue.main.async {
            errorView?.removeFromSuperview()
            errorView = nil
        }
    }
    
    @objc func pressed(sender: UIButton!) {
        removeErrorDialog()
    }
}
