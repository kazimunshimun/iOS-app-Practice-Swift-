//
//  OnTripViewController.swift
//  Navigo
//
//  Created by Anik on 2/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Panels
import UIKit

class OnTripViewController: UIViewController, Panelable {

    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerPanel: UIView!
    
    @IBOutlet weak var onTripMultiColorView: RoundedCornerView!
    @IBOutlet weak var upButton: UIImageView!
    @IBOutlet weak var onTripTitleLabel: UILabel!
    @IBOutlet weak var onTripDescriptionLabel: UILabel!
    @IBOutlet weak var onTripDurationLabel: UILabel!
    
    @IBOutlet weak var titleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    
    var tripTimeRemainingCounter = 571
    var timerForTrip = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startDriverArrivalTimer()
    }
    

    fileprivate func startDriverArrivalTimer() {
        timerForTrip.invalidate() // just in case this button is tapped multiple times
        // start the timer
        timerForTrip = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(tripTimerAction), userInfo: nil, repeats: true)
    }
    
    @objc func tripTimerAction() {
        if tripTimeRemainingCounter > 0 {
            tripTimeRemainingCounter -= 1
            let min = tripTimeRemainingCounter / 60
            let sec = tripTimeRemainingCounter % 60
            var secString = ""
            if sec < 10 {
                secString = "0\(sec)"
            } else {
                secString = "\(sec)"
            }
            
            onTripDurationLabel.text = "\(min):\(secString)"
        } else {
            timerForTrip.invalidate()
            //go back to basic callback
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}