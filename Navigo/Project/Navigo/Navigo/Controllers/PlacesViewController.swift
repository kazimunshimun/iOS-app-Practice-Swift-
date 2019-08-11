//
//  PlacesViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class PlacesViewController: UIViewController, SideMenuItemContent {

    enum SelectedTab: Int {
        case history = 0
        case upcoming = 1
    }
    
    var nowSelectedTab: SelectedTab = .history
    
    @IBOutlet weak var tripTableView: UITableView!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var selectedViewLeading: NSLayoutConstraint!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var tabIndicatorView: UIView!
    
    var placeList: [TripEntity] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tripTableView.register(UINib(nibName: "TripsCell", bundle: nil), forCellReuseIdentifier: "tripCell")
        self.tripTableView.delegate = self
        self.tripTableView.dataSource = self
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.historyViewClicked))
        historyView.addGestureRecognizer(gesture)
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.upcomingViewClicked))
        upcomingView.addGestureRecognizer(gesture2)
        
        updateHistoryViews()

    }
    
    func updateHistoryViews() {
        DispatchQueue.global(qos: .userInitiated).async {
            TripData.shared.getHistoryTrips() { trips in
                DispatchQueue.main.async {
                    self.placeList = trips
                    self.tripTableView.reloadData()
                }
            }
        }
    }
    
    func updateUpcomingViews() {
        DispatchQueue.global(qos: .userInitiated).async {
            TripData.shared.getUpcomingTrips() { trips in
                DispatchQueue.main.async {
                    self.placeList = trips
                    self.tripTableView.reloadData()
                }
            }
        }
    }
    
    @objc func historyViewClicked() {
        if nowSelectedTab == .history {
            return
        }
        nowSelectedTab = .history
        updateHistoryViews()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            UIView.animate(withDuration: 0.25, animations: {
                self.selectedViewLeading.constant = 0
                self.historyLabel.textColor = .black
                self.upcomingLabel.textColor = ColorUtils.colorRGB(166, 173, 187)
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func upcomingViewClicked() {
        if nowSelectedTab == .upcoming {
            return
        }
        nowSelectedTab = .upcoming
        updateUpcomingViews()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            UIView.animate(withDuration: 0.25, animations: {
                self.selectedViewLeading.constant = self.tabIndicatorView.frame.width
                self.historyLabel.textColor = ColorUtils.colorRGB(166, 173, 187)
                self.upcomingLabel.textColor = .black
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
    }

}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripsCell
        if placeList.count > 0 {
            let place = placeList[indexPath.row]
            cell.dateAndTImeLabel.text = place.dateAndTime
            cell.pickupLabel.text = place.pickupLocationName
            cell.destinationLabel.text = place.destinationLocationName
        }
        return cell
    }
}
