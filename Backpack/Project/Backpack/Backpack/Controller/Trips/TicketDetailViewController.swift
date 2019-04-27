//
//  TicketDetailViewController.swift
//  Backpack
//
//  Created by Anik on 26/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TicketDetailViewController: UIViewController {

    @IBOutlet weak var departureFromCityLabel: UILabel!
    @IBOutlet weak var departureFromAirportShortLabel: UILabel!
    @IBOutlet weak var departureFromTimeLabel: UILabel!
    @IBOutlet weak var departureFromAirportInfoLabel: UILabel!
    
    @IBOutlet weak var departureFlightTimeLabel: UILabel!
    
    @IBOutlet weak var departureToCityLabel: UILabel!
    @IBOutlet weak var departureToAirportShortLabel: UILabel!
    @IBOutlet weak var departureToTimeLabel: UILabel!
    @IBOutlet weak var departureToAirportInfoLabel: UILabel!
    
    @IBOutlet weak var returnFromCityLabel: UILabel!
    @IBOutlet weak var returnFromAirportShortLabel: UILabel!
    @IBOutlet weak var returnFromTimeLabel: UILabel!
    @IBOutlet weak var returnFromAirportInfoLabel: UILabel!
    
    @IBOutlet weak var returnFlightTimeLabel: UILabel!
    
    @IBOutlet weak var returnToCityLabel: UILabel!
    @IBOutlet weak var returnToAirportShortLabel: UILabel!
    @IBOutlet weak var returnToTimeLabel: UILabel!
    @IBOutlet weak var returnToAirportInfoLabel: UILabel!
    
    var newTrip: NewTrip!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        departureFromCityLabel.text = newTrip.ticketInfo?.airportFrom?.city
        departureFromAirportShortLabel.text = "(\(newTrip.ticketInfo!.airportFrom!.shortForm))"
        departureFromTimeLabel.text = newTrip.ticketInfo?.flightTimeFromStart
        departureFromAirportInfoLabel.text = "\(newTrip.ticketInfo!.departureDate!) - 1 adult \(newTrip.ticketInfo!.ticketClass!) \n\(newTrip.ticketInfo!.airportFrom!.name)\nTerminal 2"
        
        departureFlightTimeLabel.text = newTrip.ticketInfo?.flightLength
        
        departureToCityLabel.text = newTrip.ticketInfo?.airportTo?.city
        departureToAirportShortLabel.text = "(\(newTrip.ticketInfo!.airportTo!.shortForm))"
        departureToTimeLabel.text = newTrip.ticketInfo?.flightTimeFromEnd
        departureToAirportInfoLabel.text = "\(newTrip.ticketInfo!.departureDate!) - 1 adult \(newTrip.ticketInfo!.ticketClass!) \n\(newTrip.ticketInfo!.airportTo!.name)\nTerminal 1"
        
        returnFromCityLabel.text = newTrip.ticketInfo?.airportTo?.city
        returnFromAirportShortLabel.text = "(\(newTrip.ticketInfo!.airportTo!.shortForm))"
        returnFromTimeLabel.text = newTrip.ticketInfo?.flightTimeToStart
        returnFromAirportInfoLabel.text = "\(newTrip.ticketInfo!.returnArrivalDate!) - 1 adult \(newTrip.ticketInfo!.ticketClass!) \n\(newTrip.ticketInfo!.airportTo!.name)\nTerminal 1"
        
        returnFlightTimeLabel.text = newTrip.ticketInfo?.flightLengthReturn
        
        returnToCityLabel.text = newTrip.ticketInfo?.airportFrom?.city
        returnToAirportShortLabel.text = "(\(newTrip.ticketInfo!.airportFrom!.shortForm))"
        returnToTimeLabel.text = newTrip.ticketInfo?.flightTimeToEnd
        returnToAirportInfoLabel.text = "\(newTrip.ticketInfo!.returnArrivalDate!) - 1 adult \(newTrip.ticketInfo!.ticketClass!) \n\(newTrip.ticketInfo!.airportFrom!.name)\nTerminal 2"
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bookTicketController" {
            // Pass the selected object to the new view controller.
            let bookTicketViewController = segue.destination as! BookTicketViewController
            bookTicketViewController.newTrip = newTrip
        }
    }
    

}
