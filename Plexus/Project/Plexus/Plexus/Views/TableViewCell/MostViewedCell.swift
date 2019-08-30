//
//  MostViewedCell.swift
//  Plexus
//
//  Created by Anik on 20/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class MostViewedCell: UITableViewCell {

    @IBOutlet weak var mostViewedLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var mostViewedLabel: UILabel!
    
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
