//
//  WishlistCell.swift
//  Plexus
//
//  Created by Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import Cosmos

class WishlistCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var courseImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
