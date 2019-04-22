//
//  FollowViewController.swift
//  Backpack
//
//  Created by Anik on 19/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class FollowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var peopleTableView: UITableView!
    
    var titleText: String = ""
    var peopleNumber: Int = 0
    var profileNameText: String = ""
    
    let peoples : [People] = [People(name: "Alex", imageName: "alex_pp", isFollwed: false),
                              People(name: "Sandra", imageName: "sandra_pp", isFollwed: false),
                              People(name: "Lisa", imageName: "lisa_pp", isFollwed: false),
                              People(name: "Mike", imageName: "mike_pp", isFollwed: false),
                              People(name: "Jennifer", imageName: "jennifer_pp", isFollwed: true),
                              People(name: "Travis", imageName: "travis_pp", isFollwed: false),
                              People(name: "Lisa", imageName: "lisa_pp", isFollwed: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        peopleTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        peopleTableView.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "peopleCell")
        
        titleLabel.text = titleText
        profileNameLabel.text = profileNameText
        if titleText == "Followers" {
            numberLabel.text = "\(peopleNumber) People following \(profileNameText)"
        } else {
            numberLabel.text = "\(peopleNumber) People followed by \(profileNameText)"
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoples.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 70.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : PeopleTableViewCell;
        
        cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell") as! PeopleTableViewCell
        
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
        //cell.userNameLabel.text = "User name \(indexPath.row)"
        return cell;
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
