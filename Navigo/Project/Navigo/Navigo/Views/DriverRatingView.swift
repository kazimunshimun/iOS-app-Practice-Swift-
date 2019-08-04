//
//  DriverRatingView.swift
//  Navigo
//
//  Created by Anik on 3/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import Cosmos

class DriverRatingView: UIView {

    let parentView = RoundedCornerView()
    let driverRatingRoundedView = RoundedCornerView()
    let submitButton = RoundedButton()
    let driverImageAndRatingInfoView = RoundedCornerView()
    
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
        
        let driverView = UIView()
        let priceView = UIView()
        let ratingView = UIView()
        
        let separatorView1 = UIView()
        let separatorView2 = UIView()
        
        
        
        parentView.addSubview(driverView)
        parentView.addSubview(priceView)
        parentView.addSubview(ratingView)
        parentView.addSubview(submitButton)
        
        driverView.translatesAutoresizingMaskIntoConstraints = false
        driverView.heightAnchor.constraint(equalToConstant: 175.0).isActive = true
        driverView.leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
        driverView.rightAnchor.constraint(equalTo: parentView.rightAnchor).isActive = true
        driverView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        driverView.backgroundColor = .clear
        
        driverView.addSubview(driverImageAndRatingInfoView)
        driverImageAndRatingInfoView.translatesAutoresizingMaskIntoConstraints = false
        driverImageAndRatingInfoView.centerXAnchor.constraint(equalTo: driverView.centerXAnchor).isActive = true
        driverImageAndRatingInfoView.topAnchor.constraint(equalTo: driverView.topAnchor, constant: 24.0).isActive = true
        driverImageAndRatingInfoView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        driverImageAndRatingInfoView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        driverImageAndRatingInfoView.backgroundColor = .clear
        
        let driverImageView = UIImageView()
        driverImageAndRatingInfoView.addSubview(driverImageView)
        driverImageView.translatesAutoresizingMaskIntoConstraints = false
        driverImageView.trailingAnchor.constraint(equalTo: driverImageAndRatingInfoView.trailingAnchor).isActive = true
        driverImageView.leadingAnchor.constraint(equalTo: driverImageAndRatingInfoView.leadingAnchor).isActive = true
        driverImageView.topAnchor.constraint(equalTo: driverImageAndRatingInfoView.topAnchor).isActive = true
        driverImageView.bottomAnchor.constraint(equalTo: driverImageAndRatingInfoView.bottomAnchor).isActive = true
        driverImageView.image = UIImage(named: "driver_icon")
        
        driverImageAndRatingInfoView.addSubview(driverRatingRoundedView)
        driverRatingRoundedView.translatesAutoresizingMaskIntoConstraints = false
        driverRatingRoundedView.trailingAnchor.constraint(equalTo: driverImageAndRatingInfoView.trailingAnchor, constant: 25.0).isActive = true
        driverRatingRoundedView.bottomAnchor.constraint(equalTo: driverImageAndRatingInfoView.bottomAnchor, constant: 25.0).isActive = true
        driverRatingRoundedView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        driverRatingRoundedView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        driverRatingRoundedView.backgroundColor = UIColor(red: 66.0/255.0, green: 212.0/255.0, blue: 231.0/255.0, alpha: 1.0)
        
        let ratingLabel = UILabel()
        driverRatingRoundedView.addSubview(ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.leadingAnchor.constraint(equalTo: driverRatingRoundedView.leadingAnchor, constant: 6).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: driverRatingRoundedView.topAnchor, constant: 6).isActive = true
        ratingLabel.text = "4.9"
        ratingLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 11)
        ratingLabel.textColor = .white
        
        let nameLabel = UILabel()
        let licenseLabel = UILabel()
        
        driverView.addSubview(nameLabel)
        driverView.addSubview(licenseLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: driverImageAndRatingInfoView.bottomAnchor, constant: 16.0).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: driverView.centerXAnchor).isActive = true
        nameLabel.text = "Alexa"
        nameLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 16)
        nameLabel.textColor = .white
        
        licenseLabel.translatesAutoresizingMaskIntoConstraints = false
        licenseLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4.0).isActive = true
        licenseLabel.centerXAnchor.constraint(equalTo: driverView.centerXAnchor).isActive = true
        licenseLabel.text = "XYZ-182"
        licenseLabel.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        licenseLabel.textColor = UIColor(white: 1.0, alpha: 0.6)
        
        driverView.addSubview(separatorView1)
        separatorView1.translatesAutoresizingMaskIntoConstraints = false
        separatorView1.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        separatorView1.leftAnchor.constraint(equalTo: driverView.leftAnchor, constant: 24).isActive = true
        separatorView1.rightAnchor.constraint(equalTo: driverView.rightAnchor, constant: -24).isActive = true
        separatorView1.bottomAnchor.constraint(equalTo: driverView.bottomAnchor, constant: -1).isActive = true
        separatorView1.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.heightAnchor.constraint(equalToConstant: 73.0).isActive = true
        priceView.leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
        priceView.rightAnchor.constraint(equalTo: parentView.rightAnchor).isActive = true
        priceView.topAnchor.constraint(equalTo: driverView.bottomAnchor).isActive = true
        priceView.backgroundColor = .clear
        
        let priceLabel = UILabel()
        priceView.addSubview(priceLabel)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: driverView.bottomAnchor, constant: 24.0).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: priceView.centerXAnchor).isActive = true
        priceLabel.text = "$48.98"
        priceLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 24)
        priceLabel.textColor = .white
        
        priceView.addSubview(separatorView2)
        separatorView2.translatesAutoresizingMaskIntoConstraints = false
        separatorView2.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        separatorView2.leftAnchor.constraint(equalTo: priceView.leftAnchor, constant: 24).isActive = true
        separatorView2.rightAnchor.constraint(equalTo: priceView.rightAnchor, constant: -24).isActive = true
        separatorView2.bottomAnchor.constraint(equalTo: priceView.bottomAnchor, constant: -1).isActive = true
        separatorView2.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.heightAnchor.constraint(equalToConstant: 111.0).isActive = true
        ratingView.leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
        ratingView.rightAnchor.constraint(equalTo: parentView.rightAnchor).isActive = true
        ratingView.topAnchor.constraint(equalTo: priceView.bottomAnchor).isActive = true
        ratingView.backgroundColor = .clear
        
        let pleaseRateLabel = UILabel()
        ratingView.addSubview(pleaseRateLabel)
        
        pleaseRateLabel.translatesAutoresizingMaskIntoConstraints = false
        pleaseRateLabel.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 18.0).isActive = true
        pleaseRateLabel.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor).isActive = true
        pleaseRateLabel.text = "Rate your trip"
        pleaseRateLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        pleaseRateLabel.textColor = UIColor(white: 1.0, alpha: 0.56)
        
        let ratingStar = CosmosView()
        ratingView.addSubview(ratingStar)
        
        ratingStar.translatesAutoresizingMaskIntoConstraints = false
        ratingStar.topAnchor.constraint(equalTo: pleaseRateLabel.bottomAnchor, constant: 9.0).isActive = true
        ratingStar.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor).isActive = true
        
        // Set image for the filled star
        ratingStar.settings.filledImage = UIImage(named: "star_filled")
        // Set image for the empty star
        ratingStar.settings.emptyImage = UIImage(named: "star_empty")
        ratingStar.rating = 4
        ratingStar.settings.fillMode = .full
        // Other fill modes: .half, .precise
        
        // Change the size of the stars
        ratingStar.settings.starSize = 24
        
        // Set the distance between stars
        ratingStar.settings.starMargin = 5
        ratingStar.settings.totalStars = 5
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        submitButton.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 24.0).isActive = true
        submitButton.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -24.0).isActive = true
        submitButton.topAnchor.constraint(equalTo: ratingView.bottomAnchor).isActive = true
        submitButton.backgroundColor = UIColor(red: 66.0/255.0, green: 212.0/255.0, blue: 231.0/255.0, alpha: 1.0)
        submitButton.setTitle("SUBMIT RATING", for: .normal)
        submitButton.titleLabel?.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 13)
        submitButton.cornerRadius = 12
        
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        parentView.topLeft = true
        parentView.topRight = true
        parentView.bottomLeft = true
        parentView.bottomRight = true
        
        driverRatingRoundedView.cornerRadius = 12
        driverRatingRoundedView.topLeft = true
        driverRatingRoundedView.topRight = true
        driverRatingRoundedView.bottomLeft = true
        driverRatingRoundedView.bottomRight = true
        
        driverImageAndRatingInfoView.cornerRadius = 12
        driverImageAndRatingInfoView.topLeft = true
        driverImageAndRatingInfoView.topRight = true
        driverImageAndRatingInfoView.bottomLeft = true
        driverImageAndRatingInfoView.bottomRight = true
    }

}
