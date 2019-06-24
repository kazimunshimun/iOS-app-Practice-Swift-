//
//  MessageCell.swift
//  SocialMeetUp
//
//  Created by Anik on 24/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var roundedCornerView: RoundedCornerView!
    @IBOutlet weak var profileImageView: RoundedCornerImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unreadMessageView: RoundedCornerView!
    @IBOutlet weak var unreadMessageCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
