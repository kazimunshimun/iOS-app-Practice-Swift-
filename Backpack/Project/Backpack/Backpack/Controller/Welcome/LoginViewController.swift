//
//  LoginViewController.swift
//  Backpack
//
//  Created by Anik on 15/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.showSpinner(onView: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.removeSpinner()
            let storyboard = UIStoryboard(name: "TabMenu", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "tabMenuController") as! MenuViewController
            self.show(vc, sender: nil)
        }
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
