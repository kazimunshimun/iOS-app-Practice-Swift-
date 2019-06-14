//
//  ProfileViewController.swift
//  Backpack
//
//  Created by Anik on 21/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var followButton: RoundedButtonWithBorder!
    @IBOutlet weak var settingsButton: RoundedButtonWithBorder!
    @IBOutlet weak var profileScrollView: UIScrollView!
    @IBOutlet weak var followersView: UIView!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var tripSementedControl: ProfileTripsSegmentedControl!
    @IBOutlet weak var tripsTableViewController: UITableView!
    
    var isOwnProfile : Bool = true
    
     var trips: [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
    }
    
    func setupViews() {
        if isOwnProfile {
            followButton.isHidden = true
            settingsButton.isHidden = false
        } else {
            followButton.isHidden = false
            settingsButton.isHidden = true
        }
        
        tripsTableViewController.delegate = self
        tripsTableViewController.dataSource = self
        tripsTableViewController.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: "profileTripCell")
        tripsTableViewController.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        followersView.addTapGesture(tapNumber: 1, target: self, action: #selector(followersViewTouched))
        followingView.addTapGesture(tapNumber: 1, target: self, action: #selector(followingViewTouched))
        
        loadCurrentTrips()
        
        tripSementedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
    }
    
    @objc func onChangeOfSegment(_ sender: ProfileTripsSegmentedControl) {
        
        print("selecred segmented control value changed: \(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex {
        case 0:
            loadCurrentTrips()
            break
        case 1:
            loadPastTrips()
            break
        default:
            break
        }
        
    }
    
    func loadCurrentTrips() {
        DispatchQueue.global(qos: .userInitiated).async {
            TripData.shared.getCurrentTrips(forUser: "Jennifer") { currentTrips in
                DispatchQueue.main.async {
                    self.trips = currentTrips
                    self.tripsTableViewController.reloadData()
                }
            }
        }
    }
    
    func loadPastTrips() {
        DispatchQueue.global(qos: .userInitiated).async {
            TripData.shared.getPastTrips(forUser: "Jennifer") { pastTrips in
                DispatchQueue.main.async {
                    self.trips = pastTrips
                    self.tripsTableViewController.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trips.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 420.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTripCell") as! TripTableViewCell
        let trip: Trip
        trip = trips[indexPath.row]
        cell.profileImageView.image = UIImage(named: trip.people.imageName)
        cell.nameLabel.text = trip.people.name
        cell.postedTimeLabel.text = trip.postedTime
        cell.tripDurationLabel.text = "\(trip.tripDuration)"
        cell.tripLocationLabel.text = trip.tripLocation
        cell.tripCurrentStatusLabel.text = trip.currentStatus
        cell.tripImageView.image = UIImage(named: trip.tripImage)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip: Trip
        trip = trips[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Feeds", bundle: nil)
        let fullPostViewController = storyBoard.instantiateViewController(withIdentifier: "fullPostView") as! PostFullViewController
        fullPostViewController.tripDetail = trip
        self.show(fullPostViewController, sender: nil)
        // self.performSegue(withIdentifier: "showChatView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func followersViewTouched() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let followViewController = storyBoard.instantiateViewController(withIdentifier: "followController") as! FollowViewController
        followViewController.peopleNumber = 125
        followViewController.profileNameText = "Lisa"
        followViewController.titleText = "Followers"
        self.show(followViewController, sender: nil)
    }
    
    @objc func followingViewTouched() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let followViewController = storyBoard.instantiateViewController(withIdentifier: "followController") as! FollowViewController
        followViewController.peopleNumber = 150
        followViewController.profileNameText = "Lisa"
        followViewController.titleText = "Following"
        self.show(followViewController, sender: nil)
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
