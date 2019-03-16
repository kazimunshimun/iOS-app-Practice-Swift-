//
//  PasswordToggleVisibilityView.swift
//  Backpack
//
//  Created by Anik on 16/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

protocol PasswordToggleVisibilityDelegate: class {
    func viewWasToggled(passwordToggleVisibilityView: PasswordToggleVisibilityView, isSelected selected: Bool)
}

class PasswordToggleVisibilityView: UIView {
    private let eyeOpenedImage: UIImage
    private let eyeClosedImage: UIImage
    private let eyeButton: UIButton
    weak var delegate: PasswordToggleVisibilityDelegate?
    
    enum EyeState {
        case open
        case closed
    }
    
    var eyeState: EyeState {
        set {
            eyeButton.isSelected = newValue == .open
        }
        get {
            return eyeButton.isSelected ? .open : .closed
        }
    }
    
    override var tintColor: UIColor! {
        didSet {
            eyeButton.tintColor = tintColor
        }
    }
    
    override init(frame: CGRect) {
        self.eyeOpenedImage = UIImage(named: "eye_open")!.withRenderingMode(.alwaysTemplate)
        self.eyeClosedImage = UIImage(named: "eye_disable")!
        self.eyeButton = UIButton(type: .custom)
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Don't use init with coder.")
    }
    
    private func setupViews() {
        let padding: CGFloat = 10
        let buttonWidth = (frame.width / 2) - padding
        let buttonFrame = CGRect(x: buttonWidth + padding, y: 0, width: buttonWidth, height: frame.height)
        eyeButton.frame = buttonFrame
        eyeButton.backgroundColor = UIColor.clear
        eyeButton.adjustsImageWhenHighlighted = false
        eyeButton.setImage(self.eyeClosedImage, for: .normal)
        eyeButton.setImage(self.eyeOpenedImage.withRenderingMode(.alwaysTemplate), for: .selected)
        eyeButton.addTarget(self, action: #selector(eyeButtonPressed), for: .touchUpInside)
        eyeButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        eyeButton.tintColor = UIColor.black
        self.addSubview(eyeButton)
    }
    
    
    @objc func eyeButtonPressed(sender: AnyObject) {
        eyeButton.isSelected = !eyeButton.isSelected
        delegate?.viewWasToggled(passwordToggleVisibilityView: self, isSelected: eyeButton.isSelected)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
