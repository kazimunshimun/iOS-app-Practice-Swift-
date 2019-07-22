//
//  TripsCell.swift
//  Navigo
//
//  Created by Anik on 22/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TripsCell: UITableViewCell {

    
    @IBOutlet weak var locationBackgroundView: RoundedCornerView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layoutIfNeeded()
        locationBackgroundView.topLeft = true
        locationBackgroundView.topRight = true
        locationBackgroundView.bottomLeft = true
        locationBackgroundView.bottomRight = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
