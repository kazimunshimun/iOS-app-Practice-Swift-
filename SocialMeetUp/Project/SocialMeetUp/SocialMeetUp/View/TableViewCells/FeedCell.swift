//
//  FeedCell.swift
//  SocialMeetUp
//
//  Created by Anik on 21/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var roundedBackgroundView: RoundedCornerView!
    @IBOutlet weak var timeDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstJoinedImageView: RoundedCornerImageView!
    @IBOutlet weak var secondJoinedImageView: RoundedCornerImageView!
    
    @IBOutlet weak var firstRoundedView: RoundedCornerView!
    @IBOutlet weak var secondRoundedView: RoundedCornerView!
    
    @IBOutlet weak var joinedCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
