//
//  ChatMessageViewCell.swift
//  Backpack
//
//  Created by Anik on 12/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ChatMessageViewCell: UITableViewCell {

    let messageLabel = UILabel()
    let messageBackgroundView = RoundedCornerView()
    var leadingConstraintsForMessageLabel: NSLayoutConstraint!
    var trailingConstraintsForMessageLabel: NSLayoutConstraint!
    
    var userImageView: RoundedCornerImageView = {
        let imageView = RoundedCornerImageView()
        imageView.cornerRadius = 15
        return imageView
    }()
    
    var chatMessage: Chat! {
        didSet {
            if chatMessage.isIncoming {
                messageBackgroundView.backgroundColor = UIColor(white: 233.0/255, alpha: 1.0)
                messageLabel.textColor = .black
                
                trailingConstraintsForMessageLabel.isActive = false
                leadingConstraintsForMessageLabel.isActive = true
                /*
                if chatMessage.isShoulShowSenderImage {
                    userImageView.isHidden = false
                } else {
                    userImageView.isHidden = true
                }
                */
                messageBackgroundView.bottomRight = true
                messageBackgroundView.topRight = true
                
                messageBackgroundView.bottomLeft = false
                messageBackgroundView.topLeft = false
            } else {
                messageBackgroundView.backgroundColor = UIColor(red: 57.0/255, green: 90.0/255, blue: 255.0/255, alpha: 1.0)
                messageLabel.textColor = .white
                
                leadingConstraintsForMessageLabel.isActive = false
                trailingConstraintsForMessageLabel.isActive = true
                
                //userImageView.isHidden = true
                
                messageBackgroundView.bottomRight = false
                messageBackgroundView.topRight = false
                
                messageBackgroundView.bottomLeft = true
                messageBackgroundView.topLeft = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewAndConstraints()
        
    }
    
    func setupViewAndConstraints() {
        addSubview(userImageView)
        addSubview(messageBackgroundView)
        addSubview(messageLabel)
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraintsForImageView = [
            userImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            userImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            userImageView.widthAnchor.constraint(equalToConstant: 30),
            userImageView.heightAnchor.constraint(equalToConstant: 30)]
        NSLayoutConstraint.activate(constraintsForImageView)
        
        messageBackgroundView.cornerRadius = 40
        
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont(name: "Montserrat-Medium", size: 12)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraintsForMessageLabel = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            messageLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, constant: -90)]
        NSLayoutConstraint.activate(constraintsForMessageLabel)
        
        messageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        let constraintsForMessageBackground = [
            messageBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
            messageBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
            messageBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            messageBackgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)]
        NSLayoutConstraint.activate(constraintsForMessageBackground)
        
        leadingConstraintsForMessageLabel = messageLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16)
        trailingConstraintsForMessageLabel = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
