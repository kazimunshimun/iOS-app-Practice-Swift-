//
//  HideShowPasswordTextField.swift
//  Backpack
//
//  Created by Anik on 16/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class HideShowPasswordTextField: BottomLineTextField {
    var preferredFont: UIFont? {
        didSet {
            self.font = preferredFont
            
            if self.isSecureTextEntry {
                self.font = nil
            }
        }
    }
    
    override var isSecureTextEntry: Bool {
        didSet {
            if !isSecureTextEntry {
                self.font = nil
                self.font = preferredFont
            }
        }
    }
    private var passwordToggleVisibilityView: PasswordToggleVisibilityView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
}

// MARK: UITextFieldDelegate needed calls
// Implement UITextFieldDelegate when you use this, and forward these calls to this class!
extension HideShowPasswordTextField {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Hack to prevent text from getting cleared
        // http://stackoverflow.com/a/29195723/1417922
        //Setting the new text.
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        textField.text = updatedString
        
        //Setting the cursor at the right place
        let selectedRange = NSMakeRange(range.location + string.count, 0)
        let from = textField.position(from: textField.beginningOfDocument, offset:selectedRange.location)!
        let to = textField.position(from: from, offset:selectedRange.length)!
        textField.selectedTextRange = textField.textRange(from: from, to: to)
        
        //Sending an action
        textField.sendActions(for: .editingChanged)
        
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        passwordToggleVisibilityView.eyeState = PasswordToggleVisibilityView.EyeState.closed
        self.isSecureTextEntry = !isSelected
    }
}

// MARK: PasswordToggleVisibilityDelegate
extension HideShowPasswordTextField: PasswordToggleVisibilityDelegate {
    func viewWasToggled(passwordToggleVisibilityView: PasswordToggleVisibilityView, isSelected selected: Bool) {
        
        // hack to fix a bug with padding when switching between secureTextEntry state
        let hackString = self.text
        self.text = " "
        self.text = hackString
        
        // hack to save our correct font.  The order here is VERY finicky
        self.isSecureTextEntry = !selected
    }
}

// MARK: Control events
extension HideShowPasswordTextField {
    @objc func passwordTextChanged(sender: AnyObject) {
//        if let password = self.text {
//            passwordToggleVisibilityView.checkmarkVisible = passwordDelegate?.isValidPassword(password: password) ?? false
//        } else {
//            passwordToggleVisibilityView.checkmarkVisible = false
//        }
    }
}

// MARK: Private helpers
extension HideShowPasswordTextField {
    private func setupViews() {
        let toggleFrame = CGRect(x: 0, y: 0, width: 66, height: frame.height)
        passwordToggleVisibilityView = PasswordToggleVisibilityView(frame: toggleFrame)
        passwordToggleVisibilityView.delegate = self
        
        self.keyboardType = .asciiCapable
        self.rightView = passwordToggleVisibilityView
        self.rightViewMode = .always
        
        self.font = self.preferredFont
        self.addTarget(self, action: #selector(HideShowPasswordTextField.passwordTextChanged(sender:)), for: .editingChanged)
        
        // if we don't do this, the eye flies in on textfield focus!
        self.rightView?.frame = self.rightViewRect(forBounds: self.bounds)
        
        // default eye state based on our initial secure text entry
        passwordToggleVisibilityView.eyeState = isSecureTextEntry ? .closed : .open
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
