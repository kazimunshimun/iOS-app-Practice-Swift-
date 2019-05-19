//
//  SignUpViewController.swift
//  Backpack
//
//  Created by Anik on 15/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        self.showSpinner(onView: self.view, showText: true, text: "", position: .center)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.removeSpinner()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "phoneNumberViewController") as! PhoneNumberInputViewController
            self.show(vc, sender: nil)
        }
    }
    // MARK: - Navigation

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
