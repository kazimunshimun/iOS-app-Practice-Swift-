//
//  BookTicketViewController.swift
//  Backpack
//
//  Created by Anik on 27/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class BookTicketViewController: UIViewController {
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var fromAirportShortLabel: UILabel!
    @IBOutlet weak var fromTicketTimeLabel: UILabel!
    @IBOutlet weak var fromAirportInfoLabel: UILabel!
    @IBOutlet weak var fromFlightTimeLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var toAirportShortLabel: UILabel!
    @IBOutlet weak var toTicketTime: UILabel!
    @IBOutlet weak var toAirportInfoLabel: UILabel!
    
    @IBOutlet weak var returnFromLabel: UILabel!
    @IBOutlet weak var returnFromDateLabel: UILabel!
    @IBOutlet weak var returnToLabel: UILabel!
    @IBOutlet weak var returnToDateLabel: UILabel!
    @IBOutlet weak var returnToFlightTimeLabel: UILabel!
    
    @IBOutlet weak var flightCostLabel: UILabel!
    var newTrip: NewTrip!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fromLabel.text = newTrip.ticketInfo?.airportFrom?.city
        fromAirportShortLabel.text = "(\(newTrip.ticketInfo!.airportFrom!.shortForm))"
        fromTicketTimeLabel.text = newTrip.ticketInfo?.flightTimeFromStart
        fromAirportInfoLabel.text = "\(newTrip.ticketInfo!.departureDate!) - 1 adult \(newTrip.ticketInfo!.ticketClass!) \n\(newTrip.ticketInfo!.airportFrom!.name)\nTerminal 2"
        fromFlightTimeLabel.text = newTrip.ticketInfo?.flightLength
        
        
        toLabel.text = newTrip.ticketInfo?.airportTo?.city
        toAirportShortLabel.text = "(\(newTrip.ticketInfo!.airportTo!.shortForm))"
        toTicketTime.text = newTrip.ticketInfo?.flightTimeFromEnd
        toAirportInfoLabel.text = "\(newTrip.ticketInfo!.departureDate!) - 1 adult \(newTrip.ticketInfo!.ticketClass!) \n\(newTrip.ticketInfo!.airportTo!.name)\nTerminal 1"
        
        let totalCost = newTrip.ticketInfo!.ticketCostFrom! + newTrip.ticketInfo!.ticketCostTo!
        flightCostLabel.text = "$\(totalCost)"
        
        returnFromLabel.text = "\(newTrip.ticketInfo!.airportTo!.shortForm)"
        returnFromDateLabel.text = "\(newTrip.ticketInfo!.returnDepartureDate!)"
        returnToLabel.text = "\(newTrip.ticketInfo!.airportFrom!.shortForm)"
        returnToDateLabel.text = "\(newTrip.ticketInfo!.returnArrivalDate!)"
        returnToFlightTimeLabel.text = "\(newTrip.ticketInfo!.flightLengthReturn!)"
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "crediCardInputController" {
            // Pass the selected object to the new view controller.
            let creditCardViewController = segue.destination as! CreditCardInputViewController
            creditCardViewController.newTrip = newTrip
        }
    }
    

}
