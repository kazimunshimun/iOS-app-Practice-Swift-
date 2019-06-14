//
//  SearchFeedViewController.swift
//  Backpack
//
//  Created by Anik on 2/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import TTRangeSlider

class SearchFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TTRangeSliderDelegate {

    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var filterViewHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var genderSelectionView: UIView!
    @IBOutlet weak var ageRangeSelectionView: UIView!
    @IBOutlet weak var searchSegmentedControl: CustomSegmentedContrl!
    @IBOutlet weak var searchTableView: UITableView!
    
    @IBOutlet weak var ageRangeSlider: TTRangeSlider!
    @IBOutlet weak var ageRangeResultLabel: UILabel!
    var isShowingFilter: Bool = true
    var isShowingPeople: Bool = false
    
    let peoples: [People] = [People(name: "Jennifer", imageName: "jennifer_pp", isFollwed: true),
                              People(name: "Alex", imageName: "alex_pp", isFollwed: false),
                              People(name: "Lisa", imageName: "lisa_pp", isFollwed: false),
                              People(name: "Sandra", imageName: "sandra_pp", isFollwed: true),
                              People(name: "Mike", imageName: "mike_pp", isFollwed: false),
                              People(name: "Travis", imageName: "travis_pp", isFollwed: false),
                              People(name: "Lisa", imageName: "lisa_pp", isFollwed: true)]
    
    let trips: [Trip] = [Trip(people: People(name: "Jennifer", imageName: "jennifer_pp", isFollwed: true), postedTime: "2 hours ago", tripDuration: 7, tripLocation: "Bali", currentStatus: "ON TRIP", description: "", isLoved: true, isShared: false, tripImage: "trip_1"),
                         Trip(people: People(name: "Lisa", imageName: "lisa_pp", isFollwed: true), postedTime: "5 hours ago", tripDuration: 12, tripLocation: "Finland", currentStatus: "IN 2 DAYS", description: "", isLoved: false, isShared: true, tripImage: "trip_2")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        searchTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        searchTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedCell")
        searchTableView.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "peopleCell")
        
        searchSegmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
        
        ageRangeSlider.delegate = self
    }
    
    func rangeSlider(_ sender: TTRangeSlider!, didChangeSelectedMinimumValue selectedMinimum: Float, andMaximumValue selectedMaximum: Float) {
        ageRangeResultLabel.text = "\(Int(selectedMinimum))-\(Int(selectedMaximum))"
    }
    
    @objc func onChangeOfSegment (_ sender : CustomSegmentedContrl) {
        switch sender.selectedSegmentIndex {
        case 0:
            isShowingPeople = false
            searchTableView.reloadData()
        case 1:
            isShowingPeople = true
            searchTableView.reloadData()
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount : Int
        if isShowingPeople {
            rowCount = peoples.count
        } else {
            rowCount = trips.count
        }
        return rowCount;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellWidth : CGFloat = 70.0;
        if !isShowingPeople {
            cellWidth = 420.0
        }
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell : UITableViewCell;
        
        if isShowingPeople {
            let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell") as! PeopleTableViewCell
            let people = peoples[indexPath.row]
            
            cell.profileImageView?.image = UIImage(named: people.imageName)
            cell.nameLabel.text = people.name
            
            if people.isFollwed {
                cell.followedDoneButton.isHidden = false
                cell.followButton.isHidden = true
            } else {
                cell.followedDoneButton.isHidden = true
                cell.followButton.isHidden = false
            }
            return cell
        } else {
            let trip = trips[indexPath.row]
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
            
            return cell
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        if isShowingFilter {
            isShowingFilter = false
            self.filterButton.setImage(UIImage(named: "close"), for: .normal)
            self.filterViewHeightConstrain.constant = 420
            self.genderSelectionView.isHidden = false
            self.ageRangeSelectionView.isHidden = false
        } else {
            filterButton.setImage(UIImage(named: "filter"), for: .normal)
            isShowingFilter = true
            filterViewHeightConstrain.constant = 110
            genderSelectionView.isHidden = true
            ageRangeSelectionView.isHidden = true
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
