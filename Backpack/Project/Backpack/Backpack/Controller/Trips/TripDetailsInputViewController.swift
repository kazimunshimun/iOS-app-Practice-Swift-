//
//  TripDetailsInputViewController.swift
//  Backpack
//
//  Created by Anik on 26/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TripDetailsInputViewController: UIViewController, CalendarCallBack {
    
    enum DateFor {
        case departureDate
        case returnDate
        case none
    }

    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var visibilitySegmentedControl: VisibilitySegmentedControl!
    @IBOutlet weak var tripKindSegmentedControl: TripKindSegmentedControl!
    @IBOutlet weak var departureDateView: RoundedViewWithShadow!
    @IBOutlet weak var returnDateView: RoundedViewWithShadow!
    @IBOutlet weak var departureDateTextField: UITextField!
    @IBOutlet weak var returnDateTextField: UITextField!
    
    let visibility = ["Female", "Male", "All"]
    let tripKind = ["Backpack", "Vacation", "Buisness"]
    
    var dateFor: DateFor = .none
    
    var newTrip: NewTrip = NewTrip()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fromLabel.text = newTrip.tripInfo?.from
        toLabel.text = newTrip.tripInfo?.to
        
        departureDateView.addTapGesture(tapNumber: 1, target: self, action: #selector(showCalendarForDeparture))
        returnDateView.addTapGesture(tapNumber: 1, target: self, action: #selector(showCalendarForReturn))
        
        let ticketInfo = TicketInfo()
        newTrip.ticketInfo = ticketInfo
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ticketClassSegue" {
            // Pass the selected object to the new view controller.
            newTrip.tripInfo?.visibility = visibility[visibilitySegmentedControl.selectedSegmentIndex]
            newTrip.tripInfo?.tripFor = tripKind[tripKindSegmentedControl.selectedSegmentIndex]
            
            let ticketDateViewController = segue.destination as! TIcketDateInputViewController
            ticketDateViewController.newTrip = newTrip
        }
    }
    
    @objc func showCalendarForDeparture(){
        dateFor = .departureDate
        showCalender()
    }
    
    @objc func showCalendarForReturn(){
        dateFor = .returnDate
        showCalender()
    }
    
    func showCalender() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Trips", bundle: nil)
        let CalendarViewController = storyBoard.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
        CalendarViewController.modalPresentationStyle = .overCurrentContext
        CalendarViewController.delegate = self
        //CalendarViewController.selectedDate = selectedDate
        self.present(CalendarViewController, animated: false, completion: nil)
    }

    func didSelectDate(date: Date) {
        if dateFor == .departureDate {
            departureDateTextField.text = date.getTitleDateFC()
            newTrip.ticketInfo?.departureDate = date.getTitleDateFC()
        } else {
            returnDateTextField.text = date.getTitleDateFC()
            newTrip.ticketInfo?.returnDate = date.getTitleDateFC()
        }
    }
}
