//
//  WaitView.swift
//  Plexus
//
//  Created by Anik on 30/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import ShimmerSwift

class WaitView: UIView {
    
    let imageView = UIImageView()
    let textView = UILabel()
    var image =  UIImage()
    let shimmerView = ShimmeringView()
    
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        
        self.image = image
        layoutInMiddle()
    }
    
    private func layoutInMiddle() {
        let waitView = UIView()
        addSubview(waitView)
        
        waitView.translatesAutoresizingMaskIntoConstraints = false
        waitView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        waitView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        waitView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        waitView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        waitView.backgroundColor = .clear
        
        waitView.addSubview(shimmerView)
        shimmerView.translatesAutoresizingMaskIntoConstraints = false
        shimmerView.centerXAnchor.constraint(equalTo: waitView.centerXAnchor).isActive = true
        shimmerView.topAnchor.constraint(equalTo: waitView.topAnchor, constant: 24).isActive = true
        shimmerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        shimmerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shimmerView.backgroundColor = .clear
        
        shimmerView.contentView = imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: shimmerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: shimmerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 42).isActive = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let pleaseWaitLabel = UILabel()
        waitView.addSubview(pleaseWaitLabel)
        pleaseWaitLabel.translatesAutoresizingMaskIntoConstraints = false
        pleaseWaitLabel.topAnchor.constraint(equalTo: shimmerView.bottomAnchor, constant: 16).isActive = true
        pleaseWaitLabel.leftAnchor.constraint(equalTo: waitView.leftAnchor, constant: 16).isActive = true
        pleaseWaitLabel.rightAnchor.constraint(equalTo: waitView.rightAnchor, constant: -16).isActive = true
        pleaseWaitLabel.text = "Please wait"
        pleaseWaitLabel.textAlignment = .center
        pleaseWaitLabel.textColor = .white
        pleaseWaitLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
    }
    
    
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func startAnimating() {
        isHidden = false
        shimmerView.isShimmering = true
    }
    
    func stopAnimating() {
        isHidden = true
        shimmerView.isShimmering = false
    }
    
}
