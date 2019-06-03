//
//  SignUpViewController.swift
//  Backpack
//
//  Created by Anik on 15/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: BottomLineTextField!
    @IBOutlet weak var emailTextField: BottomLineTextField!
    @IBOutlet weak var passwordTextField: HideShowPasswordTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        self.showSpinner(onView: self.view, showText: true, text: "", position: .center)
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
            // ...
            if let error = error {
                //strongSelf.showMessagePrompt(error.localizedDescription)
                print(error.localizedDescription)
                self.showErrorDialog(onView: self.view, title: "Error!", descriptionText: error.localizedDescription)
                self.removeSpinner()
                return
            }
            self.showPhoneNumberViewController()
        }
        
    }
    // MARK: - Navigation
    func showPhoneNumberViewController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.removeSpinner()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "phoneNumberViewController") as! PhoneNumberInputViewController
            self.show(vc, sender: nil)
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        self.showSpinner(onView: self.view, showText: false, position: .center)
////        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////
////        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.removeSpinner()
//        }
    }
    

}
