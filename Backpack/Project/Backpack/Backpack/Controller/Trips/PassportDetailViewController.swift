//
//  PassportDetailViewController.swift
//  Backpack
//
//  Created by Anik on 26/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class PassportDetailViewController: UIViewController, SelectionCallBack {

    @IBOutlet weak var passportCountryView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var expireMonthView: UIView!
    @IBOutlet weak var expireMonthLabel: UILabel!
    @IBOutlet weak var expireYearView: UIView!
    @IBOutlet weak var expireYearLabel: UILabel!
    
    var selectionDataForYear: [String] = []
    var selectionDataForMonth: [String] = []
    var selectionDataForCountry: [String]!
    let year = Calendar.current.component(.year, from: Date())
    
    enum SelectionChoosen {
        case country
        case year
        case month
    }
    
    var selectionShown: SelectionChoosen = .country
    
    var newTrip: NewTrip!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectionDataForYear.append("\(year)")
        for n in 1...10 {
            selectionDataForYear.append("\(year + n)")
        }
        
        let dateFormatter = DateFormatter()
        for months in 0..<12 {
            selectionDataForMonth.append("\(dateFormatter.shortMonthSymbols[months])")
        }
        
        let locale = Locale.current
        selectionDataForCountry = Locale.isoRegionCodes.map {
            locale.localizedString(forRegionCode: $0)!
            }.sorted()
        
        passportCountryView.addTapGesture(tapNumber: 1, target: self, action: #selector(showSelectionViewForCountry))
        expireYearView.addTapGesture(tapNumber: 1, target: self, action: #selector(showSelectionViewForYear))
        expireMonthView.addTapGesture(tapNumber: 1, target: self, action: #selector(showSelectionViewForMonth))
    }
    
    @objc func showSelectionViewForCountry(){
        selectionShown = .country
        showSelectionViewWithData(data: selectionDataForCountry)
    }
    @objc func showSelectionViewForYear(){
        selectionShown = .year
        showSelectionViewWithData(data: selectionDataForYear)
    }
    
    @objc func showSelectionViewForMonth(){
        selectionShown = .month
        showSelectionViewWithData(data: selectionDataForMonth)
    }
    
    func showSelectionViewWithData(data: [String]) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Trips", bundle: nil)
        let selectionViewController = storyBoard.instantiateViewController(withIdentifier: "selectionViewController") as! SelectionViewController
        selectionViewController.modalPresentationStyle = .overCurrentContext
        selectionViewController.delegate = self
        selectionViewController.selectionChoices = data
        selectionViewController.selectedIndex = IndexPath(row: 0, section: 0)
        self.present(selectionViewController, animated: false, completion: nil)
    }
    
    func didSelectIndex(index: IndexPath) {
        if selectionShown == .year {
            expireYearLabel.text = selectionDataForYear[index.row]
        } else if selectionShown == .month {
            expireMonthLabel.text = selectionDataForMonth[index.row]
        } else {
            countryLabel.text = selectionDataForCountry[index.row]
        }
    }
    

    @IBAction func saveDetailCheckBoxButtonClicked(_ sender: UIButton) {
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
        if segue.identifier == "ticketDetailViewController" {
            // Pass the selected object to the new view controller.
            let ticketViewController = segue.destination as! TicketDetailViewController
            ticketViewController.newTrip = newTrip
        }
    }
    

}
