//
//  ReadMoreView.swift
//  SocialMeetUp
//
//  Created by Anik on 1/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ReadMoreView: UIView {

    let titleBackgroundView = RoundedCornerView()
    var data: String = ""
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.data = text
        
        setUpViewAndConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpViewAndConstraints() {
        
        addSubview(titleBackgroundView)
        let titleLabel = UILabel()
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 500).isActive = true
        titleLabel.text = data
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        titleLabel.textAlignment = .left
        
        titleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        titleBackgroundView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -80).isActive = true
        titleBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        titleBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        titleBackgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        titleBackgroundView.backgroundColor = .white
        titleBackgroundView.cornerRadius = 60
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        titleBackgroundView.topLeft = true
    }
    

}
