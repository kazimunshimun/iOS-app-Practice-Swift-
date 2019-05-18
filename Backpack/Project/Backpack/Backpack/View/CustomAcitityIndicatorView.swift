//
//  CustomAcitityIndicatorView.swift
//  Backpack
//
//  Created by Anik on 22/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

enum AcitvityIndicatorPosition {
    case center
    case bottom
}
class CustomAcitityIndicatorView: UIView {

    let imageView = UIImageView()
    let textView = UILabel()
    var image =  UIImage()
    
    init(frame: CGRect, image: UIImage, isWithText: Bool, position: AcitvityIndicatorPosition) {
        super.init(frame: frame)
        
        self.image = image
        
        if position == .center {
            layoutInMiddle(isWithText: isWithText)
        } else if position == .bottom {
            layoutInBottom(isWithText: isWithText)
        }
    }
    
    private func layoutInMiddle(isWithText: Bool) {
        let waitView = UIView()
        addSubview(waitView)
        
        waitView.translatesAutoresizingMaskIntoConstraints = false
        //waitView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        //waitView.rightAnchor.constraint(equalTo: rightAnchor, constant: 24).isActive = true
        waitView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        waitView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        waitView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        waitView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        waitView.backgroundColor = .clear
        
        let roundedCornerView = RoundedViewWithShadow()
        waitView.addSubview(roundedCornerView)
        roundedCornerView.translatesAutoresizingMaskIntoConstraints = false
        roundedCornerView.centerXAnchor.constraint(equalTo: waitView.centerXAnchor).isActive = true
        roundedCornerView.topAnchor.constraint(equalTo: waitView.topAnchor, constant: 24).isActive = true
        roundedCornerView.heightAnchor.constraint(equalToConstant: 136).isActive = true
        roundedCornerView.widthAnchor.constraint(equalToConstant: 136).isActive = true
        roundedCornerView.cornerRadius = 68
        roundedCornerView.backgroundColor = .white
        
        roundedCornerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: roundedCornerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: roundedCornerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 42).isActive = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if isWithText {
            let pleaseWaitLabel = UILabel()
            waitView.addSubview(pleaseWaitLabel)
            pleaseWaitLabel.translatesAutoresizingMaskIntoConstraints = false
            pleaseWaitLabel.topAnchor.constraint(equalTo: roundedCornerView.bottomAnchor, constant: 16).isActive = true
            pleaseWaitLabel.leftAnchor.constraint(equalTo: waitView.leftAnchor, constant: 16).isActive = true
            pleaseWaitLabel.rightAnchor.constraint(equalTo: waitView.rightAnchor, constant: -16).isActive = true
            pleaseWaitLabel.text = "Please wait"
            pleaseWaitLabel.textAlignment = .center
            pleaseWaitLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
            
            let reasonTextView = UITextView()
            waitView.addSubview(reasonTextView)
            reasonTextView.translatesAutoresizingMaskIntoConstraints = false
            reasonTextView.topAnchor.constraint(equalTo: pleaseWaitLabel.bottomAnchor, constant: 4).isActive = true
            reasonTextView.leftAnchor.constraint(equalTo: waitView.leftAnchor, constant: 16).isActive = true
            reasonTextView.rightAnchor.constraint(equalTo: waitView.rightAnchor, constant: -16).isActive = true
            reasonTextView.text = "The connections seems to be slow"
            reasonTextView.textAlignment = .center
            reasonTextView.font = UIFont(name: "Poppins-Regular", size: 12)
            reasonTextView.isEditable = false
            reasonTextView.isScrollEnabled = false
            reasonTextView.backgroundColor = .clear
        }
    }
    
    private func layoutInBottom(isWithText: Bool) {
        let waitView = RoundedView()
        addSubview(waitView)
        
        waitView.translatesAutoresizingMaskIntoConstraints = false
        //waitView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        //waitView.rightAnchor.constraint(equalTo: rightAnchor, constant: 24).isActive = true
        waitView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        waitView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        waitView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        waitView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        waitView.backgroundColor = .white
        waitView.cornerRadius = 5
        
        waitView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.rightAnchor.constraint(equalTo: waitView.rightAnchor, constant: -16).isActive = true
        imageView.centerYAnchor.constraint(equalTo: waitView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 42).isActive = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if isWithText {
            let pleaseWaitLabel = UILabel()
            waitView.addSubview(pleaseWaitLabel)
            pleaseWaitLabel.translatesAutoresizingMaskIntoConstraints = false
            pleaseWaitLabel.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
            pleaseWaitLabel.leftAnchor.constraint(equalTo: waitView.leftAnchor, constant: 16).isActive = true
            pleaseWaitLabel.rightAnchor.constraint(equalTo: imageView.leftAnchor, constant: -16).isActive = true
            pleaseWaitLabel.text = "Please wait"
            pleaseWaitLabel.textAlignment = .left
            pleaseWaitLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
            
            let reasonLabel = UILabel()
            waitView.addSubview(reasonLabel)
            reasonLabel.translatesAutoresizingMaskIntoConstraints = false
            reasonLabel.topAnchor.constraint(equalTo: pleaseWaitLabel.bottomAnchor, constant: 4).isActive = true
            reasonLabel.leftAnchor.constraint(equalTo: waitView.leftAnchor, constant: 16).isActive = true
            reasonLabel.rightAnchor.constraint(equalTo: waitView.rightAnchor, constant: -16).isActive = true
            reasonLabel.text = "The connections seems to be slow"
            reasonLabel.textAlignment = .left
            reasonLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func startAnimating() {
        isHidden = false
        rotate()
    }
    
    func stopAnimating() {
        isHidden = true
        removeRotation()
    }
    
    private func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 3
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.imageView.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    private func removeRotation() {
        self.imageView.layer.removeAnimation(forKey: "rotationAnimation")
    }

}
