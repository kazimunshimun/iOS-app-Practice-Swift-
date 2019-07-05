//
//  FeedDataSource.swift
//  SocialMeetUp
//
//  Created by Anik on 3/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class FeedDataSource : GenericDataSource<Feed>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedCell
        
        let feed = self.data.value[indexPath.row]
        
        if indexPath.row + 1 < self.data.value.count {
            let nextFeed = self.data.value[indexPath.row + 1]
            cell.contentView.backgroundColor = nextFeed.feedColor
            //cell.backgroundColor = nextFeed.feedColor
        }
        
        if indexPath.row == self.data.value.count - 1 {
            cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#9599B3")
        }
        cell.timeDateLabel.text = "\(feed.timeDate.dayOfWeek) \(feed.timeDate.fromTime)"
        cell.titleLabel.text = feed.title
        cell.roundedBackgroundView.backgroundColor = feed.feedColor
        
        cell.feedIconImageView.image = UIImage(named: feed.feedIcon)
        
        switch feed.joinedPeople.count {
        case 0:
            cell.joinedCountLabel.text = "Be the first to join"
            cell.firstRoundedView.isHidden = true
            cell.secondRoundedView.isHidden = true
        case 1:
            var firstName: String
            if let first = feed.joinedPeople[0].name.components(separatedBy: " ").first {
                firstName = first
            } else {
                firstName = feed.joinedPeople[0].name
            }
            cell.joinedCountLabel.text = "\(firstName) joined"
            cell.firstRoundedView.isHidden = false
            cell.secondRoundedView.isHidden = true
            cell.firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
        case 2:
            var firstName1: String
            if let first = feed.joinedPeople[0].name.components(separatedBy: " ").first {
                firstName1 = first
            } else {
                firstName1 = feed.joinedPeople[0].name
            }
            
            var firstName2: String
            if let first = feed.joinedPeople[1].name.components(separatedBy: " ").first {
                firstName2 = first
            } else {
                firstName2 = feed.joinedPeople[1].name
            }
            cell.joinedCountLabel.text = "\(firstName1) and \(firstName2) joined"
            cell.firstRoundedView.isHidden = false
            cell.secondRoundedView.isHidden = false
            cell.firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
            cell.secondJoinedImageView.image = UIImage(named: feed.joinedPeople[1].imageName)
        default:
            var firstName1: String
            if let first = feed.joinedPeople[0].name.components(separatedBy: " ").first {
                firstName1 = first
            } else {
                firstName1 = feed.joinedPeople[0].name
            }
            
            var firstName2: String
            if let first = feed.joinedPeople[1].name.components(separatedBy: " ").first {
                firstName2 = first
            } else {
                firstName2 = feed.joinedPeople[1].name
            }
            cell.joinedCountLabel.text = "\(firstName1), \(firstName2) and \(feed.joinedPeople.count - 2) others"
            cell.firstRoundedView.isHidden = false
            cell.secondRoundedView.isHidden = false
            cell.firstJoinedImageView.image = UIImage(named: feed.joinedPeople[0].imageName)
            cell.secondJoinedImageView.image = UIImage(named: feed.joinedPeople[1].imageName)
        }
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = feed.feedColor
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }

}
