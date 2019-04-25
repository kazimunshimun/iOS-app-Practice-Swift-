//
//  TIcketDateInputViewController.swift
//  Backpack
//
//  Created by Anik on 26/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TIcketDateInputViewController: UIViewController {
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var departureTextField: UITextField!
    @IBOutlet weak var returnDateTextField: UITextField!
    @IBOutlet weak var ticketClassView: RoundedViewWithShadow!
    
    
    var newTrip: NewTrip = NewTrip()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fromLabel.text = newTrip.tripInfo?.from
        toLabel.text = newTrip.tripInfo?.to
        departureTextField.text = newTrip.ticketInfo?.departureDate
        returnDateTextField.text = newTrip.ticketInfo?.returnDate
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
     flightChooserSegue
        // Pass the selected object to the new view controller.
    }
    */

}
