//
//  BookingCell.swift
//  Navigo
//
//  Created by Anik on 9/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class BookingCell: UITableViewCell {

    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image1View: RoundedImageView!
    @IBOutlet weak var image2View: RoundedImageView!
    @IBOutlet weak var image3View: RoundedImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
