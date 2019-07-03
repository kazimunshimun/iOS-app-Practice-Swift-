//
//  NotificationDataSource.swift
//  SocialMeetUp
//
//  Created by Anik on 3/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class NotificationDataSource : GenericDataSource<Notifiation>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationCell
        let notification = data.value[indexPath.row]
        cell.titleLabel.text = notification.title
        cell.profileImageView.image = UIImage(named: notification.sender.imageName)
        cell.timeAgoLabel.text = notification.sentTimeAgo
        
        if notification.isRead {
            cell.roundedCornerView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#352641")
        } else {
            cell.roundedCornerView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#D47FA6")
        }
        
        if indexPath.row + 1 < data.value.count {
            let nextNotification = data.value[indexPath.row + 1]
            
            if nextNotification.isRead {
                cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#352641")
            } else {
                cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#D47FA6")
            }
        }
        
        return cell
    }
    
}
