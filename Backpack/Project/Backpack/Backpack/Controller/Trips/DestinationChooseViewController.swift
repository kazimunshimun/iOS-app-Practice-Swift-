//
//  DestinationChooseViewController.swift
//  Backpack
//
//  Created by Anik on 26/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class DestinationChooseViewController: UIViewController {

    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var bestPriceLabel: UILabel!
    @IBOutlet weak var nextFlightLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    var newTrip: NewTrip = NewTrip()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func fromTextFieldEditEnd(_ sender: Any) {
        fromLabel.text = fromTextField.text
    }
    
    @IBAction func toTextFieldEditEnd(_ sender: Any) {
        toLabel.text = toTextField.text
        
        if !fromTextField.text!.isEmpty {
            durationLabel.isHidden = false
            bestPriceLabel.isHidden = false
            nextFlightLabel.isHidden = false
        }
    }
    
    @IBAction func returnKeyPressed(_ sender: Any) {
        fromLabel.text = fromTextField.text
    }
    

    @IBAction func returnKeyPressedTo(_ sender: Any) {
        toLabel.text = toTextField.text
        
        if !fromTextField.text!.isEmpty {
            durationLabel.isHidden = false
            bestPriceLabel.isHidden = false
            nextFlightLabel.isHidden = false
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "tripDetailSegue" {
            // Pass the selected object to the new view controller.
            if !fromTextField.text!.isEmpty && !toTextField.text!.isEmpty {
                let tripInfo = TripInfo(from: fromTextField.text!, to: toTextField.text!)
                newTrip.tripInfo = tripInfo
                
                let tripDetailViewController = segue.destination as! TripDetailsInputViewController
                tripDetailViewController.newTrip = newTrip
            }
        }
        
    }
    

}
