//
//  FeedViewController.swift
//  Backpack
//
//  Created by Anik on 21/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    let trips: [Trip] = [Trip(people: People(name: "Jennifer", imageName: "jennifer_pp", isFollwed: true), postedTime: "2 hours ago", tripDuration: 7, tripLocation: "Bali", currentStatus: "ON TRIP", description: "", isLoved: true, isShared: false, tripImage: "trip_3"),
//                         Trip(people: People(name: "Lisa", imageName: "lisa_pp", isFollwed: true), postedTime: "5 hours ago", tripDuration: 12, tripLocation: "Finland", currentStatus: "IN 2 DAYS", description: "", isLoved: false, isShared: true, tripImage: "trip_4"),
//                         Trip(people: People(name: "Sandra", imageName: "sandra_pp", isFollwed: true), postedTime: "6 hours ago", tripDuration: 9, tripLocation: "Japan", currentStatus: "ON TRIP", description: "", isLoved: true, isShared: true, tripImage: "trip_2")]
    
    var trips: [Trip] = []
    
    let popularDestination = [PopularDestination(image: "bali-1", name: "BALI"),
                       PopularDestination(image: "japan-1", name: "JAPAN"),
                       PopularDestination(image: "finland-1", name: "FINLAND"),
                       PopularDestination(image: "prague", name: "PRAGUE"),
                       PopularDestination(image: "italy", name: "ITALY"),
                       PopularDestination(image: "argentina", name: "ARGENTINA"),
                       PopularDestination(image: "bali_1", name: "BALI"),
    ]
    
    @IBOutlet weak var feedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        feedTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedCell")
        feedTableView.register(UINib(nibName: "PopularDestinationTableViewCell", bundle: nil), forCellReuseIdentifier: "popularDestinationCell")
        
        loadFeedTrips()
    }
    
    func loadFeedTrips() {
        DispatchQueue.global(qos: .userInitiated).async {
            FeedData.shared.getFeeds() { feeds in
                DispatchQueue.main.async {
                    self.trips = feeds
                    self.feedTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count + 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellWidth : CGFloat = 420.0;
        if indexPath.row == 1 {
            cellWidth = 260.0
        }
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "popularCell2") as! PopularDestinationTableViewCell2
            cell.destinationArray = popularDestination
            return cell;
        } else{
            if trips.count > 0 {
                let trip: Trip
                if indexPath.row > 1 {
                    trip = trips[indexPath.row - 1]
                } else {
                    trip = trips[indexPath.row]
                }
                let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedTableViewCell
                cell.profileImageView.image = UIImage(named: trip.people.imageName)
                cell.nameLabel.text = trip.people.name
                cell.postedTimeLabel.text = trip.postedTime
                cell.tripDurationLabel.text = "\(trip.tripDuration)"
                cell.tripLocationLabel.text = trip.tripLocation
                cell.tripCurrentStatusLabel.text = trip.currentStatus
                if trip.isLoved {
                    cell.loveButton.setImage(UIImage(named: "heart_selected"), for: .normal)
                } else {
                    cell.loveButton.setImage(UIImage(named: "heart_unselected"), for: .normal)
                }
                
                if trip.isShared {
                    cell.sharedLabel.isHidden = false
                } else {
                    cell.sharedLabel.isHidden = true
                }
                
                cell.tripImageView.image = UIImage(named: trip.tripImage)
                return cell;
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "popularCell2") as! PopularDestinationTableViewCell2
                cell.destinationArray = popularDestination
                return cell;
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip: Trip
        if indexPath.row > 1 {
            trip = trips[indexPath.row - 1]
        } else {
            trip = trips[indexPath.row]
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Feeds", bundle: nil)
        let fullPostViewController = storyBoard.instantiateViewController(withIdentifier: "fullPostView") as! PostFullViewController
        self.show(fullPostViewController, sender: nil)
        fullPostViewController.tripDetail = trip
        // self.performSegue(withIdentifier: "showChatView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
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
