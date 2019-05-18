//
//  FeedTableViewCell.swift
//  Backpack
//
//  Created by Anik on 30/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: RoundedCornerImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postedTimeLabel: UILabel!
    @IBOutlet weak var tripDurationLabel: RoundedBackgroundLabel!
    @IBOutlet weak var tripLocationLabel: UILabel!
    @IBOutlet weak var tripCurrentStatusLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var sharedLabel: RoundedButton!
    @IBOutlet weak var tripImageView: TopLeftRightRadiusImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
