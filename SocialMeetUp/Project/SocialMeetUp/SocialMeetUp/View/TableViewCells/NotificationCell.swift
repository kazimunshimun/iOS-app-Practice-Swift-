//
//  NotificationCell.swift
//  SocialMeetUp
//
//  Created by Anik on 24/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var roundedCornerView: RoundedCornerView!
    @IBOutlet weak var profileImageView: RoundedCornerImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
