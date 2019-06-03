//
//  CustomAlertDialogView.swift
//  Backpack
//
//  Created by Anik on 3/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class CustomAlertDialogView: UIView {

    //let imageView = UIImageView()
    //let titleLabel = UILabel()
    //let descriptionLabel = UILabel()
    //var image =  UIImage()
    
    let okButton = RoundedButton()
    
    var titleText: String = "Error!"
    var descriptionText: String = "Something wrong happend"
    
    init(frame: CGRect, title: String, description: String) {
        super.init(frame: frame)
        
        //self.image = image
        titleText = title
        descriptionText = description
    
        setUpViewAndConstraints()
    }

    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpViewAndConstraints() {
        let errorView = UIView()
        addSubview(errorView)
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        errorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        errorView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        errorView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        errorView.backgroundColor = .clear
        
        let roundedCornerView = RoundedViewWithShadow()
        errorView.addSubview(roundedCornerView)
        roundedCornerView.translatesAutoresizingMaskIntoConstraints = false
        //roundedCornerView.centerXAnchor.constraint(equalTo: errorView.centerXAnchor).isActive = true
        roundedCornerView.topAnchor.constraint(equalTo: errorView.topAnchor, constant: 24).isActive = true
        roundedCornerView.leftAnchor.constraint(equalTo: errorView.leftAnchor, constant: 20).isActive = true
        roundedCornerView.rightAnchor.constraint(equalTo: errorView.rightAnchor, constant: -20).isActive = true
        roundedCornerView.heightAnchor.constraint(equalToConstant: 188).isActive = true
        roundedCornerView.cornerRadius = 10
        roundedCornerView.backgroundColor = .white
        
        let titleLabel = UILabel()
        roundedCornerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: roundedCornerView.topAnchor, constant: 16).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: roundedCornerView.centerXAnchor).isActive = true
        titleLabel.text = titleText
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        
        let descriptionLabel = UILabel()
        roundedCornerView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: roundedCornerView.leftAnchor, constant: 8).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: roundedCornerView.rightAnchor, constant: -8).isActive = true
        descriptionLabel.text = descriptionText
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 3
        descriptionLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        
        roundedCornerView.addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.topAnchor.constraint(equalTo: roundedCornerView.bottomAnchor, constant: -56).isActive = true
        okButton.leftAnchor.constraint(equalTo: roundedCornerView.leftAnchor, constant: 16).isActive = true
        okButton.rightAnchor.constraint(equalTo: roundedCornerView.rightAnchor, constant: -16).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        okButton.setTitle("OK", for: .normal)
        okButton.backgroundColor = .red
        okButton.cornerRadius = 20
    }
}
