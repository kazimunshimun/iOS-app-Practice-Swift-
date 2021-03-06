//
//  ViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {

    enum SelectedTab: Int {
        case signIn = 0
        case signUp = 1
    }
    
    var nowSelectedTab: SelectedTab = .signIn
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var blinkView: UIView!
    @IBOutlet weak var signView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var indicatorView: UIView!
    
    @IBOutlet weak var signInView: RoundedCornerView!
    @IBOutlet weak var signUpView: RoundedCornerView!
    
    @IBOutlet weak var signInEmailTextField: UITextField!
    @IBOutlet weak var signInPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpNameTextField: UITextField!
    @IBOutlet weak var signUpEmailTextField: UITextField!
    @IBOutlet weak var signUpPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        startBlink()
    }
    
    private func setupViews() {
        signView.alpha = 0.0
        signView.transform = CGAffineTransform(translationX: 0, y: 359)
        
        signInEmailTextField.setLeftPaddingPoints(15)
        signInPasswordTextField.setLeftPaddingPoints(15)
        
        signUpNameTextField.setLeftPaddingPoints(15)
        signUpEmailTextField.setLeftPaddingPoints(15)
        signUpPasswordTextField.setLeftPaddingPoints(15)
    }

    func startBlink() {
        UIView.animate(withDuration: 0.7,
            delay:0.0,
            options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
            animations: {
                UIView.setAnimationRepeatCount(3)
                self.blinkView.alpha = 0.0
        }, completion: { (finished: Bool) in
            self.startSignInAnimation()
        })
    }
    
    private func startSignInAnimation() {
        UIView.animate(withDuration: 1.0,
            delay:0.0,
            options:[.curveEaseInOut],
            animations: {
                self.signView.alpha = 1.0
                self.signView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -280)
        }, completion: nil)
    }
    
    @IBAction func signInTabClicked(_ sender: Any) {
        if nowSelectedTab == .signIn {
            return
        }
        print("Sign In tab clicked")
        UIView.animate(withDuration: 0.5,
                       delay:0.0,
                       options:[.curveEaseInOut],
                       animations: {
                        self.signInButton.alpha = 1.0
                        self.signUpButton.alpha = 0.65
                        self.indicatorView.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: { (_: Bool) in
            self.nowSelectedTab = .signIn
            self.signInView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.signUpView.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    @IBAction func signUpTabClicked(_ sender: Any) {
        if nowSelectedTab == .signUp {
            return
        }
        print("Sign Up tab clicked")
        UIView.animate(withDuration: 0.5,
                       delay:0.0,
                       options:[.curveEaseInOut],
                       animations: {
                        self.signInButton.alpha = 0.65
                        self.signUpButton.alpha = 1.0
                        self.indicatorView.transform = CGAffineTransform(translationX: self.signInButton.frame.width, y: 0)
        }, completion: { (_: Bool) in
            self.nowSelectedTab = .signUp
            self.signInView.transform = CGAffineTransform(translationX: -self.signView.frame.width, y: 0)
            self.signUpView.transform = CGAffineTransform(translationX: -self.signView.frame.width, y: 0)
        })
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

