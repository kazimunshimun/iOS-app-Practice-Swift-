//
//  CreditCardInputViewController.swift
//  Backpack
//
//  Created by Anik on 26/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class CreditCardInputViewController: UIViewController, SelectionCallBack {
    

    @IBOutlet weak var paymentMethodView: UIView!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    @IBOutlet weak var expireYearView: UIView!
    @IBOutlet weak var expireYearLabel: UILabel!
    @IBOutlet weak var expireMonthView: UIView!
    @IBOutlet weak var expireMonthLabel: UILabel!
    
    var selectionDataForYear: [String] = []
    var selectionDataForMonth: [String] = []
    var selectionDataForCard: [String] = ["Credit Card", "Debit Card"]
    let year = Calendar.current.component(.year, from: Date())
    
    enum SelectionChoosen {
        case card
        case year
        case month
    }
    
    var selectionShown: SelectionChoosen = .card
    
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
        
        paymentMethodView.addTapGesture(tapNumber: 1, target: self, action: #selector(showSelectionViewForCard))
        expireYearView.addTapGesture(tapNumber: 1, target: self, action: #selector(showSelectionViewForYear))
        expireMonthView.addTapGesture(tapNumber: 1, target: self, action: #selector(showSelectionViewForMonth))
    }
    
    @IBAction func checkBoxButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @objc func showSelectionViewForCard(){
        selectionShown = .card
        showSelectionViewWithData(data: selectionDataForCard)
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
    
    func didSelectIndex(index: IndexPath) {
        if selectionShown == .year {
            expireYearLabel.text = selectionDataForYear[index.row]
        } else if selectionShown == .month {
            expireMonthLabel.text = selectionDataForMonth[index.row]
        } else {
            paymentMethodLabel.text = selectionDataForCard[index.row]
        }
    }

}
