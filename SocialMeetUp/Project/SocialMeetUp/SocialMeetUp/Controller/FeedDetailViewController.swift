//
//  FeedDetailViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {

    var feed: Feed!
    
    @IBOutlet weak var topView: RoundedCornerView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstJoinedImageView: RoundedCornerImageView!
    @IBOutlet weak var secondJoinedImageView: RoundedCornerImageView!
    
    @IBOutlet weak var firstRoundedView: RoundedCornerView!
    @IBOutlet weak var secondRoundedView: RoundedCornerView!
    
    @IBOutlet weak var joinedCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        topView.backgroundColor = feed?.feedColor
        titleLabel.text = feed.title
        
        updateJoinedByView()
    }
    
    func updateJoinedByView() {
        switch feed?.joinedPeople.count {
        case 0:
            joinedCountLabel.text = "Be the first to join"
            firstRoundedView.isHidden = true
            secondRoundedView.isHidden = true
        case 1:
            joinedCountLabel.text = "\(feed.joinedPeople[0].name) joined"
            firstRoundedView.isHidden = false
            secondRoundedView.isHidden = true
            firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
        case 2:
            joinedCountLabel.text = "\(feed.joinedPeople[0].name) and \(feed.joinedPeople[1].name) joined"
            firstRoundedView.isHidden = false
            secondRoundedView.isHidden = false
            firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
            secondJoinedImageView.image = UIImage(named: feed.joinedPeople[1].imageName)
        default:
            joinedCountLabel.text = "\(feed.joinedPeople[0].name), \(feed.joinedPeople[1].name) and \(feed.joinedPeople.count - 2) others"
            firstRoundedView.isHidden = false
            secondRoundedView.isHidden = false
            firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
            secondJoinedImageView.image = UIImage(named: feed.joinedPeople[1].imageName)
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
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
