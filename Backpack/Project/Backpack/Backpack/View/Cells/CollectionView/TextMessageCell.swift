//
//  TextMessageCell.swift
//  Backpack
//
//  Created by Anik on 9/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TextMessageCell: UICollectionViewCell {
    
    open var cellTopLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    open var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    open var messageContainerView: RoundedCornerView = {
        let containerView = RoundedCornerView()
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        return containerView
    }()
    
    open var userImageView: RoundedCornerImageView = {
        let imageView = RoundedCornerImageView()
        imageView.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(cellTopLabel)
        self.contentView.backgroundColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("Interface Builder is not supported!")
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        cellTopLabel.text = nil
        messageLabel.text = nil
       // messageTopLabel.text = nil
       // messageBottomLabel.text = nil
    }
}
