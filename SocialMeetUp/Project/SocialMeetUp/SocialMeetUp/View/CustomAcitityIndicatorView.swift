//
//  CustomAcitityIndicatorView.swift
//  Backpack
//
//  Created by Anik on 22/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class CustomAcitityIndicatorView: UIView {

    let imageView = UIImageView()
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    //var image =  UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        
        waitView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: waitView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: waitView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.image = UIImage(named: "wait_1")
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        waitView.addSubview(imageView1)
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.centerXAnchor.constraint(equalTo: waitView.centerXAnchor).isActive = true
        imageView1.centerYAnchor.constraint(equalTo: waitView.centerYAnchor).isActive = true
        imageView1.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView1.widthAnchor.constraint(equalToConstant: 75).isActive = true
        imageView1.image = UIImage(named: "wait_2")
        imageView1.contentMode = .scaleAspectFit
        imageView1.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        waitView.addSubview(imageView2)
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView2.centerXAnchor.constraint(equalTo: waitView.centerXAnchor).isActive = true
        imageView2.centerYAnchor.constraint(equalTo: waitView.centerYAnchor).isActive = true
        imageView2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView2.image = UIImage(named: "wait_3")
        imageView2.contentMode = .scaleAspectFit
        imageView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let pleaseWaitLabel = UILabel()
        waitView.addSubview(pleaseWaitLabel)
        pleaseWaitLabel.translatesAutoresizingMaskIntoConstraints = false
        pleaseWaitLabel.topAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: 8).isActive = true
        pleaseWaitLabel.leftAnchor.constraint(equalTo: imageView2.leftAnchor, constant: 0).isActive = true
        pleaseWaitLabel.rightAnchor.constraint(equalTo: imageView2.rightAnchor, constant: 0).isActive = true
        pleaseWaitLabel.text = "Please wait"
        pleaseWaitLabel.textAlignment = .center
        pleaseWaitLabel.textColor = .white
        pleaseWaitLabel.font = UIFont(name: "Montserrat-Bold", size: 14)
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func startAnimating() {
        isHidden = false
        //rotate()
    }
    
    func stopAnimating() {
        isHidden = true
        //removeRotation()
    }
    
    private func rotate() {
        let scaleAnim = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnim.values = [0, 0.5, 0, 0.5, 0, 0.5, 0]
        scaleAnim.duration = 4.0
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 3
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.imageView.layer.add(scaleAnim, forKey: "rotationAnimation")
        self.imageView1.layer.add(scaleAnim, forKey: "rotationAnimation")
        self.imageView2.layer.add(scaleAnim, forKey: "rotationAnimation")
    }
    
    private func removeRotation() {
        self.imageView.layer.removeAnimation(forKey: "rotationAnimation")
        self.imageView1.layer.removeAnimation(forKey: "rotationAnimation")
        self.imageView2.layer.removeAnimation(forKey: "rotationAnimation")
    }

}
