//
//  AirlineChooserViewController.swift
//  Backpack
//
//  Created by Anik on 27/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class AirlineChooserViewController: UIViewController, HorizontalPickerViewCallBack {
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var airlinePickerView: UIPickerView!
    
    @IBOutlet weak var departureAirlineLabel: UILabel!
    
    
    @IBOutlet weak var departureAirportShortLabel: UILabel!
    @IBOutlet weak var returnAirportShortLabel: UILabel!
    
    
    @IBOutlet weak var departureDateLabel: UILabel!
    @IBOutlet weak var returnDateLabel: UILabel!
    
    @IBOutlet weak var filghtTimeLabel: UILabel!
    
    @IBOutlet weak var departureCostLabel: UILabel!
    
    
    @IBOutlet weak var returnAirlineLabel: UILabel!
    @IBOutlet weak var departureAirportShort2Label: UILabel!
    @IBOutlet weak var departureDate2Label: UILabel!
    @IBOutlet weak var arrivalAirportShort2Label: UILabel!
    @IBOutlet weak var arrivalDate2Label: UILabel!
    @IBOutlet weak var flightRetunTimeLabel: UILabel!
    @IBOutlet weak var returnCostLabel: UILabel!
    
    var airlinePicker: HorizontalCustomPickerView!
    var rotationAngle: CGFloat!
    
    var newTrip: NewTrip!
    
    var ticketInfoDataForDeparture: [TicketInfo]!
    var ticketInfoDataForReturn: [TicketInfo]!
    
    var airports: [Airport] = [Airport(name: "Paris Orly Airport", short: "ORY", city: "Paris"),
                                       Airport(name: "Dubai International Airport", short: "DXB", city: "Dubai"),
                                       Airport(name: "London City Airport", short: "LCY", city: "London"),
                                       Airport(name: "Toronto City Centre Airport", short: "YTZ", city: "Toronto"),
                                       Airport(name: "Los Angeles International Airport", short: "LAX", city: "Los Angeles"),
                                       Airport(name: "Tokyo Haneda Airport", short: "HND", city: "Tokyo"),
                                       Airport(name: "Hong Kong International Airport", short: "HKA", city: "Hong Kong"),
                                       Airport(name: "Shanghai Pudong International Airport", short: "PVG", city: "Shanghai"),
                                       Airport(name: "Amsterdam Airport Schiphol", short: "AMS", city: "Amsterdam"),
                                       Airport(name: "Frankfurt Airport", short: "FRA", city: "Frankfurt"),
                                       Airport(name: "Seoul Incheon International Airport", short: "ICN", city: "Seoul"),
                                       Airport(name: "Istanbul Atatürk Airport ()", short: "IST", city: "Istanbul"),
                                       Airport(name: "Singapore Changi Airport", short: "SIN", city: "Singapore"),
                                       Airport(name: "Denver International Airport ()", short: "DEN", city: "Denver")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ticketInfoDataForDeparture = [TicketInfo(airlineName: "American Airlines", ticketClass: "Economy", ticketFrom: newTrip.tripInfo?.from, ticketTo: newTrip.tripInfo?.to, ticketCost: 369, departureDate: newTrip.ticketInfo?.departureDate, returnDate: newTrip.ticketInfo?.returnDate, flightLength: "3h 45m", travelDate: newTrip.ticketInfo?.departureDate),
                                      TicketInfo(airlineName: "Air Canada", ticketClass: "Economy", ticketFrom: newTrip.tripInfo?.from, ticketTo: newTrip.tripInfo?.to, ticketCost: 379, departureDate: "12:45, 1 MAR", returnDate: "15:40, 1 MAR", flightLength: "2h 55m", travelDate: newTrip.ticketInfo?.departureDate),
                          TicketInfo(airlineName: "Alaska Airlines", ticketClass: "Primium Economy", ticketFrom: newTrip.tripInfo?.from, ticketTo: newTrip.tripInfo?.to, ticketCost: 399, departureDate: "18:05, 1 MAR", returnDate: "20:30, 1 MAR", flightLength: "2h 25m", travelDate: newTrip.ticketInfo?.departureDate),
                          TicketInfo(airlineName: "JetBlue Airways", ticketClass: "Buisness", ticketFrom: newTrip.tripInfo?.from, ticketTo: newTrip.tripInfo?.to, ticketCost: 429, departureDate: "10:15, 1 MAR", returnDate: "12:15, 1 MAR", flightLength: "2h 00m", travelDate: newTrip.ticketInfo?.departureDate),
                          TicketInfo(airlineName: "British Airways", ticketClass: "Buisness", ticketFrom: newTrip.tripInfo?.from, ticketTo: newTrip.tripInfo?.to, ticketCost: 449, departureDate: "02:00, 1 MAR", returnDate: "03:45, 1 MAR", flightLength: "1h 45m", travelDate: newTrip.ticketInfo?.departureDate),
                          TicketInfo(airlineName: "Lufthansa", ticketClass: "First", ticketFrom: newTrip.tripInfo?.from, ticketTo: newTrip.tripInfo?.to, ticketCost: 499, departureDate: "10:45, 1 MAR", returnDate: "12:00, 1 MAR", flightLength: "1h 15m", travelDate: newTrip.ticketInfo?.departureDate)]
        
        ticketInfoDataForReturn = [TicketInfo(airlineName: "American Airlines", ticketClass: "Economy", ticketFrom: newTrip.tripInfo?.to, ticketTo: newTrip.tripInfo?.from, ticketCost: 369, departureDate: newTrip.ticketInfo?.departureDate, returnDate: newTrip.ticketInfo?.returnDate, flightLength: "3h 05m", travelDate: newTrip.ticketInfo?.returnDate),
                                      TicketInfo(airlineName: "Air Canada", ticketClass: "Economy", ticketFrom: newTrip.tripInfo?.to, ticketTo: newTrip.tripInfo?.from, ticketCost: 379, departureDate: "12:45, 4 MAR", returnDate: "15:40, 4 MAR", flightLength: "2h 25m", travelDate: newTrip.ticketInfo?.returnDate),
                                      TicketInfo(airlineName: "Alaska Airlines", ticketClass: "Primium Economy", ticketFrom: newTrip.tripInfo?.to, ticketTo: newTrip.tripInfo?.from, ticketCost: 399, departureDate: "10:45, 4 MAR", returnDate: "13:05, 4 MAR", flightLength: "2h 20m", travelDate: newTrip.ticketInfo?.returnDate),
                                      TicketInfo(airlineName: "JetBlue Airways", ticketClass: "Buisness", ticketFrom: newTrip.tripInfo?.to, ticketTo: newTrip.tripInfo?.from, ticketCost: 429, departureDate: "01:00, 4 MAR", returnDate: "03:20, 4 MAR", flightLength: "2h 20m", travelDate: newTrip.ticketInfo?.returnDate),
                                      TicketInfo(airlineName: "British Airways", ticketClass: "Buisness", ticketFrom: newTrip.tripInfo?.to, ticketTo: newTrip.tripInfo?.from, ticketCost: 449, departureDate: "08:25, 4 MAR", returnDate: "09:50, 4 MAR", flightLength: "1h 25m", travelDate: newTrip.ticketInfo?.returnDate),
                                      TicketInfo(airlineName: "Lufthansa", ticketClass: "First", ticketFrom: newTrip.tripInfo?.to, ticketTo: newTrip.tripInfo?.from, ticketCost: 499, departureDate: "06:05, 4 MAR", returnDate: "07:40, 4 MAR", flightLength: "1h 35m")]
        
        fromLabel.text = newTrip.tripInfo?.from
        toLabel.text = newTrip.tripInfo?.to
        
        rotationAngle = -90 * (.pi / 180)
        airlinePicker = HorizontalCustomPickerView()
        
        airlinePicker.callBackDelegate = self
        airlinePicker.pickerData = ticketInfoDataForDeparture
        
        let y = airlinePickerView.frame.origin.y
//        print("before pickerView x: \(airlinePickerView.frame.origin.x) y: \(airlinePickerView.frame.origin.y) width: \(airlinePickerView.frame.width) height: \(airlinePickerView.frame.height)")
        airlinePickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
//        print("after pickerView x: \(airlinePickerView.frame.origin.x) y: \(airlinePickerView.frame.origin.y) width: \(airlinePickerView.frame.width) height: \(airlinePickerView.frame.height)")
        airlinePickerView.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 70)
        airlinePickerView.delegate = airlinePicker
        airlinePickerView.dataSource = airlinePicker
        
        airlinePickerView.selectRow(2, inComponent: 0, animated: false)
        didSelectTicket(ticket: ticketInfoDataForDeparture[2], index: 2)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func didSelectTicket(ticket: TicketInfo, index: Int) {
        print("ticket selceted")
        departureCostLabel.text = "$\(ticket.ticketCost!)"
        departureAirlineLabel.text = ticket.airlineName
        
        let airportFrom = getAirportDetail(cityName: ticket.ticketFrom!)
        let airportTo = getAirportDetail(cityName: ticket.ticketTo!)
        departureAirportShortLabel.text = airportFrom?.shortForm
        returnAirportShortLabel.text = airportTo?.shortForm

        departureDateLabel.text = ticket.departureDate
        returnDateLabel.text = ticket.returnDate
        
        filghtTimeLabel.text = ticket.flightLength
        
        
        let returnTickeInfo = ticketInfoDataForReturn[index]
        returnAirlineLabel.text = returnTickeInfo.airlineName
        departureAirportShort2Label.text = airportTo?.shortForm
        departureDate2Label.text = returnTickeInfo.departureDate
        arrivalAirportShort2Label.text = airportFrom?.shortForm
        arrivalDate2Label.text = returnTickeInfo.returnDate
        flightRetunTimeLabel.text = returnTickeInfo.flightLength
        returnCostLabel.text = "$\(returnTickeInfo.ticketCost!)"
        
        newTrip.ticketInfo?.airportFrom = airportFrom!
        newTrip.ticketInfo?.airportTo = airportTo!
        newTrip.ticketInfo?.ticketCostFrom = ticket.ticketCost!
        newTrip.ticketInfo?.ticketCostTo = returnTickeInfo.ticketCost!
        newTrip.ticketInfo?.flightLengthReturn = returnTickeInfo.flightLength!
        newTrip.ticketInfo?.flightLength = ticket.flightLength
        
        newTrip.ticketInfo?.flightTimeFromStart = String(ticket.departureDate!.prefix(5))
        newTrip.ticketInfo?.flightTimeFromEnd = String(ticket.returnDate!.prefix(5))
        
        newTrip.ticketInfo?.returnDepartureDate = returnTickeInfo.departureDate
        newTrip.ticketInfo?.returnArrivalDate = returnTickeInfo.returnDate
    }
    
    func getAirportDetail(cityName: String) -> Airport? {
        for airport in airports {
            if airport.city == cityName {
                return airport
            }
        }
        return nil
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
