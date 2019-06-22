//
//  ProfileViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 21/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var meetupCountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var messageCountView: RoundedCornerView!
    @IBOutlet weak var messageCountLabel: UILabel!
    
    @IBOutlet weak var notificationCountView: RoundedCornerView!
    @IBOutlet weak var notificationCountLabel: UILabel!
    
    @IBOutlet weak var aboutMeLabel: UILabel!
    @IBOutlet weak var timelineLabel: UILabel!
    
    var profileViewModel: ProfileViewModel = ProfileViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        profileImageView.image = UIImage(named: profileViewModel.profile.profileImage)
        meetupCountLabel.text = "\(profileViewModel.profile.meetupCount) meetups"
        nameLabel.text = profileViewModel.profile.name
        
        if profileViewModel.profile.messageCount == 0 {
            messageCountView.isHidden = true
        } else {
            messageCountLabel.text = "\(profileViewModel.profile.messageCount)"
        }
        
        if profileViewModel.profile.notificationCount == 0 {
            notificationCountView.isHidden = true
        } else {
            notificationCountLabel.text = "\(profileViewModel.profile.notificationCount)"
        }
        
        aboutMeLabel.text = profileViewModel.profile.aboutMe
        timelineLabel.text = profileViewModel.profile.timeline
    }
    

    @IBAction func editButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func messageButtonClicked(_ sender: Any) {
        print("message button clicked")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Messaging", bundle: nil)
        let messageViewController = storyBoard.instantiateViewController(withIdentifier: "messageView") as! MessageViewController
        show(messageViewController, sender: nil)
    }
    
    @IBAction func notificationButtonClicked(_ sender: Any) {
        print("notification button clicked")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let notificationViewController = storyBoard.instantiateViewController(withIdentifier: "notificationView") as! NotificationViewController
        show(notificationViewController, sender: nil)
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
