//
//  SearchFeedViewController.swift
//  Backpack
//
//  Created by Anik on 2/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class SearchFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var filterViewHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var genderSelectionView: UIView!
    @IBOutlet weak var ageRangeSelectionView: UIView!
    @IBOutlet weak var searchSegmentedControl: CustomSegmentedContrl!
    @IBOutlet weak var searchTableView: UITableView!
    
    var isShowingFilter : Bool = true
    var isShowingPeople : Bool = false
    
    let peoples : [People] = [People(name: "Jennifer", imageName: "jennifer_pp", isFollwed: true),
                              People(name: "Alex", imageName: "alex_pp", isFollwed: false),
                              People(name: "Lisa", imageName: "lisa_pp", isFollwed: false),
                              People(name: "Sandra", imageName: "sandra_pp", isFollwed: true),
                              People(name: "Mike", imageName: "mike_pp", isFollwed: false),
                              People(name: "Travis", imageName: "travis_pp", isFollwed: false),
                              People(name: "Lisa", imageName: "lisa_pp", isFollwed: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        searchTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        searchTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedCell")
        searchTableView.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "peopleCell")
        
        searchSegmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
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
            rowCount = 3
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedTableViewCell
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
