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
    @IBOutlet weak var tripsTableViewController: UITableView!
    
    var isOwnProfile : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if isOwnProfile {
            followButton.isHidden = true
            settingsButton.isHidden = false
        } else {
            followButton.isHidden = false
            settingsButton.isHidden = true
        }
        
        tripsTableViewController.delegate = self
        tripsTableViewController.dataSource = self
        tripsTableViewController.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedCell")
        
        followersView.addTapGesture(tapNumber: 1, target: self, action: #selector(followersViewTouched))
        followingView.addTapGesture(tapNumber: 1, target: self, action: #selector(followersViewTouched))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 420.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedTableViewCell
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Feeds", bundle: nil)
        let fullPostViewController = storyBoard.instantiateViewController(withIdentifier: "fullPostView") as! PostFullViewController
        self.show(fullPostViewController, sender: nil)
        // self.performSegue(withIdentifier: "showChatView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func followersViewTouched() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let followViewController = storyBoard.instantiateViewController(withIdentifier: "followController")
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
