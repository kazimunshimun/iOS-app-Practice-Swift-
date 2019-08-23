//
//  DesiredLevelCell.swift
//  Plexus
//
//  Created by Anik on 23/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class DesiredLevelCell: UITableViewCell {

    @IBOutlet weak var levelNumberLabel: UILabel!
    @IBOutlet weak var levelTitleLabel: UILabel!
    
    @IBOutlet weak var levelBackImageVIew: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
