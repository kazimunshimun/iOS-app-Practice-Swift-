//
//  IncomingChatCell.swift
//  SocialMeetUp
//
//  Created by Anik on 29/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class IncomingChatCell: UITableViewCell {

    @IBOutlet weak var chatTextCell: UILabel!
    @IBOutlet weak var textBackgroundView: RoundedCornerView!
    @IBOutlet weak var senderImageView: RoundedCornerImageView!
    @IBOutlet weak var senderNameLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        textBackgroundView.bottomRight = true
        textBackgroundView.topRight = true
    }
}
