//
//  ChatDataSource.swift
//  SocialMeetUp
//
//  Created by Anik on 4/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class ChatDataSource : GenericDataSource<Chat>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = data.value[indexPath.row]
        if message.isIncoming {
            let cell = tableView.dequeueReusableCell(withIdentifier: "incomingCell", for: indexPath) as! IncomingChatCell
            cell.chatTextCell.text = message.text
            cell.senderImageView.image = UIImage(named: message.profile.imageName)
            cell.senderNameLabel.text = message.profile.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "outgoingCell2", for: indexPath) as! OutgoingChat2Cell
            cell.chatTextCell.text = message.text
            cell.senderImageView.image = UIImage(named: message.profile.imageName)
            cell.senderNameLabel.text = message.profile.name
            return cell
        }
    }
    
}
