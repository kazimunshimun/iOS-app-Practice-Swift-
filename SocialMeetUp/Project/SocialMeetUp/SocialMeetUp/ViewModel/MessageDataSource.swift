//
//  MessageDataSource.swift
//  SocialMeetUp
//
//  Created by Anik on 3/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class MessageDataSource : GenericDataSource<Message>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageCell
        
        let message = data.value[indexPath.row]
        
        cell.profileImageView.image = UIImage(named: message.sender.imageName)
        cell.nameLabel.text = message.sender.name
        cell.titleLabel.text = message.title
        cell.timeAgoLabel.text = message.sentTimeAgo
        
        var cellBackgroundColor: UIColor
        if message.isRead {
            cellBackgroundColor = ColorUtils.hexStringToUIColor(hex: "#241332")
            cell.unreadMessageView.isHidden = true
        } else {
            cellBackgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
            cell.unreadMessageView.isHidden = false
            cell.unreadMessageCountLabel.text = "\(message.unreadMessageCount)"
        }
        cell.roundedCornerView.backgroundColor = cellBackgroundColor
        
        if indexPath.row + 1 < data.value.count {
            let nextMessage = data.value[indexPath.row + 1]
            
            if nextMessage.isRead {
                cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#241332")
            } else {
                cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
            }
        }
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = cellBackgroundColor
        cell.selectedBackgroundView = backgroundView
        
        return cell
        
    }
    
}
