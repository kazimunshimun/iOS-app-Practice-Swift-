//
//  NewDocumentViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class NewDocumentViewController: UIViewController {

    @IBOutlet weak var documentTextView: UITextView!
    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        documentTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector:#selector(NewDocumentViewController.keyBoardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(NewDocumentViewController.keyBoardWillHide(_:)), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // MARK:Keyboard notifications
    @objc func keyBoardWillShow(_ note:NSNotification) {
        let userInfo  = note.userInfo
        let keyBoardBounds = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyBoardBounds.size.height - 14
        let animations = {
            self.bottomView.transform = CGAffineTransform(translationX: 0, y: -deltaY)
        }
        
        if duration > 0 {
            UIView.animate(withDuration: duration, delay: 0, options:[.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
        }else {
            animations()
        }
    }
    
    @objc func keyBoardWillHide(_ note:NSNotification) {
        let userInfo  = note.userInfo
        let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations = {
            self.bottomView.transform = .identity
        }
        
        if duration > 0 {
            UIView.animate(withDuration: duration, delay: 0, options:[.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
        }else{
            animations()
        }
        
    }
    
    
    @IBAction func boldButtonClicked(_ sender: Any) {
        if let range = documentTextView.selectedTextRange {
            let selectedText = documentTextView.text(in: range)
            if selectedText!.count > 0 {
               // let paragraphStyle = NSMutableParagraphStyle()
               // paragraphStyle.alignment = NSTextAlignment.center
            } else {
                let changedFontDescriptor = UIFont.systemFont(ofSize: (CGFloat)(15.0))
                let typ = documentTextView.typingAttributes[NSAttributedString.Key.font] as? UIFont
                if ( typ == changedFontDescriptor) {
                    self.documentTextView.typingAttributes[NSAttributedString.Key.font] = UIFont.boldSystemFont(ofSize: (CGFloat)(15))
                }else {
                    self.documentTextView.typingAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: (CGFloat)(15))
                }
            }
        }
        
        
    }
    
    @IBAction func italicButtonClicked(_ sender: Any) {
        let typ = documentTextView.typingAttributes[NSAttributedString.Key.obliqueness] as? NSNumber
        if typ == 0.5 {
            documentTextView.typingAttributes[NSAttributedString.Key.obliqueness] = 0
        }else {
            documentTextView.typingAttributes[NSAttributedString.Key.obliqueness] = 0.5
        }
    }
    
    @IBAction func underlineButtonClicked(_ sender: Any) {
        let typ = documentTextView.typingAttributes[NSAttributedString.Key.underlineStyle] as? NSNumber
        if (typ == 1) {
            self.documentTextView.typingAttributes[NSAttributedString.Key.underlineStyle] = 0
        } else {
            self.documentTextView.typingAttributes[NSAttributedString.Key.underlineStyle] = 1
        }
    }
    
    @IBAction func textColorChangeButtonClicked(_ sender: Any) {
        //let typ = documentTextView.typingAttributes[NSAttributedString.Key.] as? NSNumber
    }
    
    @IBAction func leftAlignButtonClicked(_ sender: Any) {
        setParagraphAlignment(newAlignmnet: .left)
    }
    
    @IBAction func centerAlignButtonClicked(_ sender: Any) {
        setParagraphAlignment(newAlignmnet: .center)
    }
    
    @IBAction func rightAlignButtonClicked(_ sender: Any) {
        setParagraphAlignment(newAlignmnet: .right)
    }
    
    private func setParagraphAlignment(newAlignmnet: NSTextAlignment) {
        if let range = documentTextView.selectedTextRange {
            let selectedText = documentTextView.text(in: range)
            if selectedText!.count > 0 {
                let newParagraphStyle = NSMutableParagraphStyle.init()
                newParagraphStyle.alignment = newAlignmnet
                let dict = [NSAttributedString.Key.paragraphStyle: newParagraphStyle]
                documentTextView.textStorage.beginEditing()
                documentTextView.textStorage.setAttributes(dict, range: documentTextView.selectedRange)
                documentTextView.textStorage.endEditing()
            } else {
                
            }
        }
    }
}

extension NewDocumentViewController : UITextViewDelegate {
    // MARK:UITextViewDelegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //let inputTextLength = text.count - range.length + documentTextView.text.count
//        if inputTextLength > 140 {
//            return false
//        }
        //characterCountLabel.text = "\(140 - inputTextLength)"
        return true
    }
}
