//
//  TripsViewController.swift
//  Backpack
//
//  Created by Anik on 21/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let requestData: [Request] = [Request(userImageName: "alex_pp", length: 7, startDate: "Wed, 4 NOV", fromLocation: "Bali", toLocation: "Mexico", lastMessage: "Hey, when are you going?", lastMessageSender: "alex", status: "Sent", tripImageName: "trip_3"),
                                  Request(userImageName: "travis_pp", length: 9, startDate: "Sat, 7 NOV", fromLocation: "London", toLocation: "Paris", lastMessage: "Are you going to city center?", lastMessageSender: "alex", status: "Sent", tripImageName: "trip_5"),
                                  Request(userImageName: "sandra_pp", length: 11, startDate: "Sat, 14 NOV", fromLocation: "Thailand", toLocation: "New Zealand", lastMessage: "Will there be hiking?", lastMessageSender: "alex", status: "Sent", tripImageName: "trip_4")]
    
    let inviteData: [Request] = [Request(userImageName: "mike_pp", length: 4, startDate: "Thr, 1 NOV", fromLocation: "India", toLocation: "Bali", lastMessage: "Hey, when are you going?", lastMessageSender: "alex", status: "Pending", tripImageName: "invites_bali"),
                                  Request(userImageName: "lisa_pp", length: 9, startDate: "Wed, 7 NOV", fromLocation: "Paris", toLocation: "Prague", lastMessage: "Are you going to city center?", lastMessageSender: "You", status: "Sent", tripImageName: "prague"),
                                  Request(userImageName: "alex_pp", length: 5, startDate: "Wed, 11 NOV", fromLocation: "Torronto", toLocation: "Scotland", lastMessage: "Will there be hiking?", lastMessageSender: "alex", status: "Sent", tripImageName: "trip_3"),
                                  Request(userImageName: "jennifer_pp", length: 5, startDate: "Wed, 11 NOV", fromLocation: "Brussels", toLocation: "Alaska", lastMessage: "Will there be hiking?", lastMessageSender: "You", status: "Pending", tripImageName: "italy")]
    
    @IBOutlet weak var requestCollectionView: UICollectionView!
    @IBOutlet weak var invitesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        requestCollectionView.delegate = self
        requestCollectionView.dataSource = self
        
        invitesCollectionView.delegate = self
        invitesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == requestCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tripRequestCell", for: indexPath) as! TripRequestCollectionViewCell
            let request = requestData[indexPath.row]
            cell.profileImageView.image = UIImage(named: request.userImageName!)
            cell.daysLabel.text = "\(request.length!)"
            cell.dateLabel.text = request.startDate!
            cell.fromLabel.text = request.fromLocation!
            cell.toLabel.text = request.toLocation!
            cell.messageLabel.text = request.lastMessage
            cell.tripImageView.image = UIImage(named: request.tripImageName!)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "invitesCell", for: indexPath) as! TripInviteCollectionViewCell
            let invite = inviteData[indexPath.row]
            cell.profileImageView.image = UIImage(named: invite.userImageName!)
            cell.daysLabel.text = "\(invite.length!)"
            cell.dateLabel.text = invite.startDate!
            cell.fromLabel.text = invite.fromLocation!
            cell.toLabel.text = invite.toLocation!
            cell.messageLabel.text = invite.lastMessage
            cell.tripImageView.image = UIImage(named: invite.tripImageName!)
            cell.messageNameLabel.text = invite.lastMessageSender
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == requestCollectionView {
            return requestData.count
        } else {
            return inviteData.count
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "requestViewController" {
            let requestViewController = segue.destination as! RequestsViewController
            requestViewController.requestData = requestData
        } else {
            let inviteViewController = segue.destination as! InvitesViewController
            inviteViewController.inviteData = inviteData
        }
    }
    

}
