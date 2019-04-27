//
//  CreditCardInputViewController.swift
//  Backpack
//
//  Created by Anik on 26/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class CreditCardInputViewController: UIViewController {

    var newTrip: NewTrip!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkBoxButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passportViewController" {
            // Pass the selected object to the new view controller.
            let passportViewController = segue.destination as! PassportDetailViewController
            passportViewController.newTrip = newTrip
        }
    }
    

}
