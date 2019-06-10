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
        label.textColor = UIColor(red: 159.0/255, green: 159.0/255, blue: 159.0/255, alpha: 1.0)
        label.font = UIFont(name: "Poppins-Regular", size: 12)
        return label
    }()
    
    open var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        return label
    }()
    
    open var messageContainerView: RoundedCornerView = {
        let containerView = RoundedCornerView()
        //containerView.clipsToBounds = true
        //containerView.layer.masksToBounds = true
        
        containerView.topLeft = true
        containerView.topRight = true
        containerView.bottomLeft = true
        containerView.bottomRight = true
        containerView.cornerRadius = 20
        return containerView
    }()
    
    open var userImageView: RoundedCornerImageView = {
        let imageView = RoundedCornerImageView()
        imageView.cornerRadius = 15
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(cellTopLabel)
        //self.contentView.backgroundColor = .gray
        
       // let topView = UIView()
        addSubview(cellTopLabel)
        
        cellTopLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTopLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cellTopLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        cellTopLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        //topView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //topView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellTopLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //topView.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        
        //topView.backgroundColor = .red
        
        let bottomView = UIView()
        addSubview(bottomView)
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: cellTopLabel.bottomAnchor, constant: 8).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        bottomView.backgroundColor = .clear
        
        bottomView.addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 0).isActive = true
        userImageView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 0).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        userImageView.backgroundColor = .blue
        
        let messageView = RoundedView()
        messageView.cornerRadius = 10
        bottomView.addSubview(messageView)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0).isActive = true
        messageView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 0).isActive = true
        messageView.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 10).isActive = true
        messageView.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: 0).isActive = true
        //messageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //messageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        messageView.backgroundColor = UIColor(red: 233.0/255, green: 233.0/255, blue: 233.0/255, alpha: 1.0)
        
        messageView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -8).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: messageView.leftAnchor, constant: 8).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: messageView.rightAnchor, constant: -8).isActive = true
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
