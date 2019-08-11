//
//  PostCell.swift
//  Navigo
//
//  Created by Anik on 11/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: RoundedImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postedDateLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var parentView: RoundedCornerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        parentView.topLeft = true
        parentView.topRight = true
        parentView.bottomLeft = true
        parentView.bottomRight = true
        self.layoutIfNeeded()
    }
}
