//
//  SearchFeedViewController.swift
//  Backpack
//
//  Created by Anik on 2/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class SearchFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchSegmentedControl: CustomSegmentedContrl!
    @IBOutlet weak var searchTableView: UITableView!
    
    var isShowingPeople : Bool = false
    
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
        return 3;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellWidth : CGFloat = 70.0;
        if !isShowingPeople {
            cellWidth = 420.0
        }
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell;
        
        if isShowingPeople {
            cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell") as! PeopleTableViewCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedTableViewCell
        }
        
        
        //cell.userNameLabel.text = "User name \(indexPath.row)"
        return cell;
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
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
