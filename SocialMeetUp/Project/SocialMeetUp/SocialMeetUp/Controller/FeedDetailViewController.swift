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
    @IBOutlet weak var joinBackgroundView: RoundedButtonWithBorder!
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
    @IBOutlet weak var locationRoundedView: RoundedCornerView!
    
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
        print("viewDidLoad called")
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    /*
    override func loadView() {
        print("load view called")
    }
    */
    
    override func viewDidLayoutSubviews() {
        locationRoundedView.topRight = true
        locationRoundedView.bottomLeft = true
    }
    
    func updateUI() {
        topView.backgroundColor = feed.feedColor
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
            joinBackgroundView.backgroundColor = .clear
            joinQuestionLabel.textColor = .black
            noJoinButton.isHidden = true
            yesJoinButton.setImage(UIImage(named: "yes_colored"), for: .disabled)
            yesJoinButton.isEnabled = false
        } else {
            spotLeftLabel.text = "\(feed.totalSpot - feed.joinedPeople.count) spots left"
            joinBackgroundView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#352641")
        }
    }
    
    func updateTimeDateView() {
        let customDateFormatter = DateFormatter()
        let weekday = NSCalendar.current.component(.weekday, from: Date())
        let today = customDateFormatter.weekdaySymbols[weekday - 1]
        /*
        if feed.timeDate.isToday {
            dayOfWeekLabel.text = "Today"
        } else {
            dayOfWeekLabel.text = feed.timeDate.dayOfWeek
        }
        */
        if today.caseInsensitiveCompare(feed.timeDate.dayOfWeek) == .orderedSame {
            dayOfWeekLabel.text = "Today"
        } else {
            dayOfWeekLabel.text = feed.timeDate.dayOfWeek
        }
        fromToTimeLabel.text = "\(feed.timeDate.fromTime) - \(feed.timeDate.toTime)"
        timeDescriptionLabel.text = "Every week on \(feed.timeDate.dayOfWeek)"
    }
    
    func updateLocationView() {
        let camera = GMSCameraPosition.camera(withLatitude: feed.location.latitudeLogitude.coordinate.latitude, longitude: feed.location.latitudeLogitude.coordinate.longitude, zoom: 14.0)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: feed.location.latitudeLogitude.coordinate.latitude, longitude: feed.location.latitudeLogitude.coordinate.longitude)
        marker.title = feed.location.name
        marker.snippet = feed.location.address
        marker.icon = UIImage(named: "map_pin")
        marker.map = mapView
        
        locationNameLabel.text = feed.location.name
        locationAddressLabel.text = feed.location.address

    }
    
    func updateCostView() {
        costLabel.text = feed.cost
    }
    
    func updateHostView() {
        hostedByLabel.text = "Hosted by \(feed.hostedBy.name)"
        descriptionLabel.text = feed.desccription
    }
    
    func updateLiveChatView() {

        switch feed?.joinedPeople.count {
        case 0:
            peopleCountLabel.text = "be first to join"
            chatFirstRoundedView.isHidden = true
            chatSecondRoundedView.isHidden = true
        case 1:
            peopleCountLabel.text = "& \(feed.joinedPeople.count - 1) others"
            chatFirstRoundedView.isHidden = false
            chatSecondRoundedView.isHidden = true
            chatFirstImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
        case 2:
            peopleCountLabel.text = "& \(feed.joinedPeople.count - 2) others"
            chatFirstRoundedView.isHidden = false
            chatSecondRoundedView.isHidden = false
            chatFirstImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
            chatSecondImageView.image = UIImage(named: feed.joinedPeople[1].imageName)
        default:
            peopleCountLabel.text = "& \(feed.joinedPeople.count - 2) others"
            chatFirstRoundedView.isHidden = false
            chatSecondRoundedView.isHidden = false
            chatFirstImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
            chatSecondImageView.image = UIImage(named: feed.joinedPeople[1].imageName)
        }
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.liveChatView.addGestureRecognizer(gesture)
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        // Do what you want
        print("Chat view clicked")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Messaging", bundle: nil)
        let chatViewController = storyBoard.instantiateViewController(withIdentifier: "chatView") as! ChatViewController
        chatViewController.topic = feed.title
        chatViewController.hostedBy = feed.hostedBy
        self.show(chatViewController, sender: nil)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    
    @IBAction func joinButtonClicked(_ sender: Any) {
        print("Join button cliced")
        self.showCountDialog(onView: self.view, maxCount: feed.totalSpot - feed.joinedPeople.count - 1)
    }
    
    @IBAction func rejectButtonClicked(_ sender: Any) {
        print("reject button cliced")
    }
    
    @IBAction func readMoreButtonClicked(_ sender: Any) {
        self.showReadMoreDialog(onView: self.view, text: feed.desccription)
    }
    
    var guestCountView : UIView?
    var cv : GuestCountView?
    
    func showCountDialog(onView : UIView, maxCount: Int) {
        let countView = UIView.init(frame: onView.bounds)
        // countView.backgroundColor = UIColor(white: 0.95, alpha: 0.95)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        countView.addSubview(blurEffectView)
        
        cv = GuestCountView(frame: onView.bounds, highestStepCount: maxCount)
        cv!.center = countView.center
        countView.addSubview(cv!)
        onView.addSubview(countView)
        guestCountView = countView
        
        cv?.nextButton.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
    }
    
    func removeCountDialog() {
        DispatchQueue.main.async {
            self.guestCountView?.removeFromSuperview()
            self.guestCountView = nil
        }
    }
    
    func getGuestCount() -> Int {
        return cv!.stepCount
    }
    
    @objc func pressed(sender: UIButton!) {
        let guestCount = getGuestCount()
        print("guest count: \(guestCount)")
        removeCountDialog()
        feed.isGoing = true
        let newPeople: [People] = PeopleData.shared.getPeople(withCount: guestCount + 1)
        feed.joinedPeople.append(contentsOf: newPeople)
        updateJoinInfoView()
        updateLiveChatView()
        updateJoinedByView()
        let alertInfo = AlertMessage(title: "You +\(guestCount) guest are going!", description: "\(dayOfWeekLabel.text!) \(feed.timeDate.fromTime) - \(feed.timeDate.toTime)", groupImage: feed.group.groupImage, message: feed.title)
        self.showSuccessDialog(onView: self.view, alertInfo: alertInfo)
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
