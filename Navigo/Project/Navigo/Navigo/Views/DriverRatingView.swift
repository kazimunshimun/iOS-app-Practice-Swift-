//
//  DriverRatingView.swift
//  Navigo
//
//  Created by Anik on 3/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class DriverRatingView: UIView {

    let parentView = RoundedCornerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewAndConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpViewAndConstraints() {
        addSubview(parentView)
        
        parentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        parentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        parentView.widthAnchor.constraint(equalToConstant: 327.0).isActive = true
        parentView.heightAnchor.constraint(equalToConstant: 427.0).isActive = true
        parentView.backgroundColor = UIColor(red: 55.0/255.0, green: 61.0/255.0, blue: 85.0/255.0, alpha: 1.0)
        parentView.cornerRadius = 12
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        parentView.topLeft = true
        parentView.topRight = true
        parentView.bottomLeft = true
        parentView.bottomRight = true
    }

}
