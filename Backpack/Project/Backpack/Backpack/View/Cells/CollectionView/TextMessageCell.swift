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
    
    let messageView = RoundedView()
    let bottomView = UIView()
    
    open var userImageView: RoundedCornerImageView = {
        let imageView = RoundedCornerImageView()
        imageView.cornerRadius = 15
        return imageView
    }()
    
    var chatMessage: Message! {
        didSet {
            print("Text message cell data did set \(chatMessage.messageId)")
            if chatMessage.isIncoming {
                messageView.backgroundColor = UIColor(red: 233.0/255, green: 233.0/255, blue: 233.0/255, alpha: 1.0)
                messageLabel.textColor = .black
                userImageView.isHidden = false
                messageLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16).isActive = true
                messageLabel.widthAnchor.constraint(lessThanOrEqualTo: bottomView.widthAnchor, constant: -46).isActive = true
            } else {
                messageView.backgroundColor = UIColor(red: 57.0/255, green: 90.0/255, blue: 255.0/255, alpha: 1.0)
                messageLabel.textColor = .white
                userImageView.isHidden = true
                
                messageLabel.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -16).isActive = true
                messageLabel.widthAnchor.constraint(lessThanOrEqualTo: bottomView.widthAnchor, constant: -46).isActive = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViewAndConstrints()

    }
    
    func setupViewAndConstrints() {
        addSubview(cellTopLabel)
        
        cellTopLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTopLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cellTopLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        cellTopLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        cellTopLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
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
        
        messageView.cornerRadius = 10
        bottomView.addSubview(messageView)
        bottomView.addSubview(messageLabel)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8).isActive = true
        messageView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8).isActive = true
        messageView.leftAnchor.constraint(equalTo: messageLabel.leftAnchor, constant: -8).isActive = true
        messageView.rightAnchor.constraint(equalTo: messageLabel.rightAnchor, constant: 8).isActive = true
        //messageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //messageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -8).isActive = true
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
