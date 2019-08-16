//
//  SignInViewController.swift
//  Plexus
//
//  Created Anik on 16/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import ActiveLabel

class SignInViewController: UIViewController, SignInViewProtocol {

	var presenter: SignInPresenterProtocol?

    @IBOutlet weak var signupLabel: ActiveLabel!
    @IBOutlet weak var termsLabel: ActiveLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        let customSignUpType = ActiveType.custom(pattern: "\\sSign up\\b") //Regex that looks for "with"
        signupLabel.enabledTypes = [.mention, .hashtag, .url, customSignUpType]
        signupLabel.text = "New user? Sign up here"
        signupLabel.customColor[customSignUpType] = ColorUtils.hexStringToUIColor(hex: "B3327E")
        signupLabel.customSelectedColor[customSignUpType] = UIColor.green
        
        signupLabel.handleCustomTap(for: customSignUpType) { element in
            print("Custom type tapped: \(element)")
        }
        
        let customTermsType = ActiveType.custom(pattern: "\\sTerms of Service\\b") //Regex that looks for "with"
        let customPolicyType = ActiveType.custom(pattern: "\\sPrivacy Policy\\b")
        termsLabel.enabledTypes = [.mention, .hashtag, .url, customTermsType, customPolicyType]
        termsLabel.text = "By creating an account, you agree to our Terms of Service and Privacy Policy"
        termsLabel.customColor[customTermsType] = ColorUtils.hexStringToUIColor(hex: "B3327E")
        termsLabel.customSelectedColor[customTermsType] = UIColor.green
        termsLabel.customColor[customPolicyType] = ColorUtils.hexStringToUIColor(hex: "B3327E")
        termsLabel.customSelectedColor[customPolicyType] = UIColor.green
        
        termsLabel.handleCustomTap(for: customTermsType) { element in
            print("Custom type tapped: \(element)")
        }
        
        termsLabel.handleCustomTap(for: customPolicyType) { element in
            print("Custom type tapped: \(element)")
        }
    }
}
