//
//  AddCell.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class AddCell: UICollectionViewCell {
    
    
   // @IBOutlet weak var roundedView: RoundedCornerView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        //roundedView.cornerRadius = 10
    }

}
