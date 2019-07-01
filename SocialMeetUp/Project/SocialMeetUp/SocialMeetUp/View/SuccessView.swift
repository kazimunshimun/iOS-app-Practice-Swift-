//
//  SuccessView.swift
//  SocialMeetUp
//
//  Created by Anik on 30/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class SuccessView: UIView {
    let shareButton = RoundedButtonWithBorder()
    let doneButton = RoundedButtonWithBorder()
    var alertInfo: AlertMessage = AlertMessage(title: "")
    let roundedView = RoundedCornerView()
    
    
    init(frame: CGRect, alertData: AlertMessage) {
        super.init(frame: frame)
        self.alertInfo = alertData
        
        setUpViewAndConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpViewAndConstraints() {
        let successView = UIView()
        addSubview(successView)
        
        successView.translatesAutoresizingMaskIntoConstraints = false
        successView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        successView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
        successView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        successView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        successView.backgroundColor = .clear
        
        let contentView = UIView()
        successView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: successView.topAnchor, constant: 60).isActive = true
        contentView.leftAnchor.constraint(equalTo: successView.leftAnchor, constant: 20).isActive = true
        contentView.rightAnchor.constraint(equalTo: successView.rightAnchor, constant: -20).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        contentView.backgroundColor = .clear
        
        let titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.text = alertInfo.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Montserrat-Bold", size: 24)
        titleLabel.textAlignment = .center
        
        let groupView = UIView()
        contentView.addSubview(groupView)
        groupView.translatesAutoresizingMaskIntoConstraints = false
        groupView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        groupView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        groupView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        groupView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        groupView.backgroundColor = .clear
        
        groupView.addSubview(roundedView)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.topAnchor.constraint(equalTo: groupView.topAnchor, constant: 8).isActive = true
        roundedView.leftAnchor.constraint(equalTo: groupView.leftAnchor, constant: 8).isActive = true
        roundedView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        roundedView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        roundedView.backgroundColor = .white
        roundedView.cornerRadius = 35
        
        let roundedImageView = RoundedCornerImageView()
        groupView.addSubview(roundedImageView)
        roundedImageView.translatesAutoresizingMaskIntoConstraints = false
        roundedImageView.topAnchor.constraint(equalTo: groupView.topAnchor, constant: 9).isActive = true
        roundedImageView.leftAnchor.constraint(equalTo: groupView.leftAnchor, constant: 9).isActive = true
        roundedImageView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        roundedImageView.widthAnchor.constraint(equalToConstant: 68).isActive = true
        roundedImageView.cornerRadius = 34
        if alertInfo.groupImage == nil {
            roundedImageView.image = UIImage(named: alertInfo.groupImageName!)
        } else {
            roundedImageView.image = alertInfo.groupImage!
        }
        
        
        let descriptionLabel = UILabel()
        groupView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: groupView.topAnchor, constant: 12).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: roundedImageView.rightAnchor, constant: 8).isActive = true
        descriptionLabel.text = alertInfo.description
        descriptionLabel.textColor = UIColor(white: 1.0, alpha: 0.6)
        descriptionLabel.font = UIFont(name: "Montserrat-SemiBold", size: 11)
        
        let groupNameLabel = UILabel()
        groupView.addSubview(groupNameLabel)
        groupNameLabel.translatesAutoresizingMaskIntoConstraints = false
        groupNameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8).isActive = true
        groupNameLabel.leftAnchor.constraint(equalTo: roundedImageView.rightAnchor, constant: 8).isActive = true
        groupNameLabel.rightAnchor.constraint(equalTo: groupView.rightAnchor, constant: -8).isActive = true
        groupNameLabel.text = alertInfo.message
        groupNameLabel.numberOfLines = 0
        groupNameLabel.textColor = .white
        groupNameLabel.font = UIFont(name: "Montserrat-Medium", size: 14)
        
        successView.addSubview(doneButton)
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.bottomAnchor.constraint(equalTo: successView.bottomAnchor, constant: -20).isActive = true
        doneButton.leftAnchor.constraint(equalTo: successView.leftAnchor).isActive = true
        doneButton.rightAnchor.constraint(equalTo: successView.rightAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        doneButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
        doneButton.setTitle("DONE", for: .normal)
        doneButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        doneButton.cornerRadius = 26
        
        successView.addSubview(shareButton)
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -20).isActive = true
        shareButton.leftAnchor.constraint(equalTo: successView.leftAnchor).isActive = true
        shareButton.rightAnchor.constraint(equalTo: successView.rightAnchor).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        shareButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#9599B3")
        shareButton.setTitle("TELL FRIENDS", for: .normal)
        shareButton.setImage(UIImage(named: "share_icon"), for: .normal)
        shareButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        shareButton.cornerRadius = 26
        
    }
    
    override func draw(_ rect: CGRect) {
        roundedView.bottomLeft = true
        roundedView.bottomRight = true
        roundedView.topLeft = true
        roundedView.topRight = true
    }
}
