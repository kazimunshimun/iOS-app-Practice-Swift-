//
//  TIcketDateInputViewController.swift
//  Backpack
//
//  Created by Anik on 26/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TIcketDateInputViewController: UIViewController, SelectionCallBack {
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var departureTextField: UITextField!
    @IBOutlet weak var returnDateTextField: UITextField!
    @IBOutlet weak var ticketClassView: RoundedViewWithShadow!
    @IBOutlet weak var classTextField: UITextField!
    
    
    var newTrip: NewTrip = NewTrip()
    let selectionData: [String] = ["Economy", "Primium Economy", "First", "Business"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fromLabel.text = newTrip.tripInfo?.from
        toLabel.text = newTrip.tripInfo?.to
        departureTextField.text = newTrip.ticketInfo?.departureDate
        returnDateTextField.text = newTrip.ticketInfo?.returnDate
        
        ticketClassView.addTapGesture(tapNumber: 1, target: self, action: #selector(showSelectionView))
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @objc func showSelectionView(){
        showTicketClass()
    }
    
    func showTicketClass() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Trips", bundle: nil)
        let selectionViewController = storyBoard.instantiateViewController(withIdentifier: "selectionViewController") as! SelectionViewController
        selectionViewController.modalPresentationStyle = .overCurrentContext
        selectionViewController.delegate = self
        selectionViewController.selectionChoices = selectionData
        selectionViewController.selectedIndex = IndexPath(row: 0, section: 0)
        self.present(selectionViewController, animated: false, completion: nil)
    }
    
    func didSelectIndex(index: IndexPath) {
        classTextField.text = selectionData[index.row]
        newTrip.ticketInfo?.ticketClass = selectionData[index.row]
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
