//
//  OnTripViewController.swift
//  Navigo
//
//  Created by Anik on 2/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Panels
import UIKit

protocol OnTripDelegate {
    func tripFinished()
}

class OnTripViewController: UIViewController, Panelable {

    var onTripDelegate: OnTripDelegate? = nil
    
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerPanel: UIView!
    
    @IBOutlet weak var onTripMultiColorView: RoundedCornerView!
    @IBOutlet weak var upButton: UIImageView!
    @IBOutlet weak var onTripTitleLabel: UILabel!
    @IBOutlet weak var onTripDescriptionLabel: UILabel!
    @IBOutlet weak var onTripDurationLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var categoryTableView: UITableView!
    
    var tripTimeRemainingCounter = 571
    var timerForTrip = Timer()
    
    var initialTotalTime : Int = 1
    
    let category: [String] = ["Play Music", "News"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialTotalTime = tripTimeRemainingCounter
        updateDuration()
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
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
            
            updateDuration()
            let progress = 1 - (Float(tripTimeRemainingCounter) / Float(initialTotalTime))
            progressBar.setProgress(progress, animated: true)
        } else {
            timerForTrip.invalidate()
            //go back to basic callback
            onTripDelegate?.tripFinished()
        }
        
    }
    
    private func updateDuration() {
        let min = tripTimeRemainingCounter / 60
        let sec = tripTimeRemainingCounter % 60
        var secString = ""
        if sec < 10 {
            secString = "0\(sec)"
        } else {
            secString = "\(sec)"
        }
        
        onTripDurationLabel.text = "\(min):\(secString)"
    }
    
    public func updateTopView(isBottom: Bool) {
        
        onTripMultiColorView.isHidden = isBottom ? true : false
        upButton.image = isBottom ? UIImage(named: "back_icon") : UIImage(named: "up_icon")
        titleTopConstraint.constant = isBottom ? 56 : 24
        titleLeadingConstraint.constant = isBottom ? 24 : 60
        
        onTripTitleLabel.font = isBottom ? UIFont(name: "HelveticaNeue-CondensedBold", size: 40) : UIFont(name: "HelveticaNeue-CondensedBold", size: 16)
        onTripDurationLabel.font = isBottom ? UIFont(name: "HelveticaNeue-Regular", size: 16) : UIFont(name: "HelveticaNeue-Regular", size: 14)
        onTripDescriptionLabel.isHidden = isBottom ? true : false
        progressBar.isHidden = isBottom ? false : true
    }
    
    

}

extension OnTripViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "onTripCategoryCell") as! OnTripCategoryCell
            cell.categoryName.text = category[indexPath.row]
            cell.section = indexPath.row
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableCell") as! OnTripCategoryNewsCell
            cell.categoryName.text = category[indexPath.row]
            //cell.section = indexPath.row
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight: CGFloat = 380.0
        if indexPath.row == 1 {
            cellHeight = 180
        }
        return cellHeight
    }
}
