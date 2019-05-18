//
//  TripRequestCollectionViewCell.swift
//  Backpack
//
//  Created by Anik on 15/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TripRequestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: RoundedCornerImageView!
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var daysLabel: RoundedBackgroundLabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var messageProfileImageView: RoundedCornerImageView!
    @IBOutlet weak var messageNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
}
