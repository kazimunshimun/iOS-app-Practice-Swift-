//
//  FeedDetailViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import GoogleMaps


class FeedDetailViewController: UIViewController {

    var feed: Feed!
    
    @IBOutlet weak var topView: RoundedCornerView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstJoinedImageView: RoundedCornerImageView!
    @IBOutlet weak var secondJoinedImageView: RoundedCornerImageView!
    
    @IBOutlet weak var firstRoundedView: RoundedCornerView!
    @IBOutlet weak var secondRoundedView: RoundedCornerView!
    
    @IBOutlet weak var joinedCountLabel: UILabel!
    
    //groupInfoView
    @IBOutlet weak var groupImageView: RoundedCornerImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupLocationLabel: UILabel!
    
    //Join request view
    @IBOutlet weak var joinQuestionLabel: UILabel!
    @IBOutlet weak var spotLeftLabel: UILabel!
    @IBOutlet weak var noJoinButton: UIButton!
    @IBOutlet weak var yesJoinButton: UIButton!
    
    //Time Date View
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var fromToTimeLabel: UILabel!
    @IBOutlet weak var timeDescriptionLabel: UILabel!
    
    
    //Location View
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var locationAddressLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    
    //Cost View
    @IBOutlet weak var costLabel: UILabel!
    
    //Host View
    @IBOutlet weak var hostedByLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //Live Chat View
    @IBOutlet weak var chatFirstRoundedView: RoundedCornerView!
    @IBOutlet weak var chatFirstImageView: RoundedCornerImageView!
    @IBOutlet weak var chatSecondRoundedView: RoundedCornerView!
    @IBOutlet weak var chatSecondImageView: RoundedCornerImageView!
    @IBOutlet weak var peopleCountLabel: UILabel!
    @IBOutlet weak var liveChatView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        topView.backgroundColor = feed?.feedColor
        titleLabel.text = feed.title
        
        updateJoinedByView()
        updateGroupInfoView()
        updateJoinInfoView()
        updateTimeDateView()
        updateLocationView()
        updateCostView()
        updateHostView()
        updateLiveChatView()
    }
    
    func updateJoinedByView() {
        
        joinedCountLabel.text = "\(feed.joinedPeople.count) people are going \(feed.totalSpot - feed.joinedPeople.count) spots left"
        switch feed?.joinedPeople.count {
        case 0:
            firstRoundedView.isHidden = true
            secondRoundedView.isHidden = true
        case 1:
            firstRoundedView.isHidden = false
            secondRoundedView.isHidden = true
            firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
        case 2:
            firstRoundedView.isHidden = false
            secondRoundedView.isHidden = false
            firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
            secondJoinedImageView.image = UIImage(named: feed.joinedPeople[1].imageName)
        default:
            firstRoundedView.isHidden = false
            secondRoundedView.isHidden = false
            firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
            secondJoinedImageView.image = UIImage(named: feed.joinedPeople[1].imageName)
        }
 
    }
    
    func updateGroupInfoView() {
        groupImageView.image = UIImage(named: feed.group.groupImage)
        groupNameLabel.text = feed.group.name
        groupLocationLabel.text = feed.group.address
    }
    
    func updateJoinInfoView() {
        if feed.isGoing {
            spotLeftLabel.text = "Edit"
        } else {
            spotLeftLabel.text = "\(feed.totalSpot - feed.joinedPeople.count) spots left"
        }
    }
    
    func updateTimeDateView() {
        if feed.timeDate.isToday {
            dayOfWeekLabel.text = "Today"
        } else {
            dayOfWeekLabel.text = feed.timeDate.dayOfWeek
        }
        
        fromToTimeLabel.text = "\(feed.timeDate.fromTime) - \(feed.timeDate.toTime)"
        timeDescriptionLabel.text = "Every week on \(feed.timeDate.dayOfWeek)"
    }
    
    func updateLocationView() {
        let camera = GMSCameraPosition.camera(withLatitude: feed.location.latitudeLogitude.coordinate.latitude, longitude: feed.location.latitudeLogitude.coordinate.longitude, zoom: 10.0)
        mapView.camera = camera
        locationNameLabel.text = feed.location.name
        locationAddressLabel.text = feed.location.address

    }
    
    func updateCostView() {
        costLabel.text = feed.cost
    }
    
    func updateHostView() {
        hostedByLabel.text = "Hosted by \(feed.hostedBy.name)"
    }
    
    func updateLiveChatView() {
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    
    @IBAction func joinButtonClicked(_ sender: Any) {
    
    }
    
    @IBAction func rejectButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func readMoreButtonClicked(_ sender: Any) {
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
