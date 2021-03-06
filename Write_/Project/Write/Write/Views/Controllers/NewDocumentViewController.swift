//
//  NewDocumentViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import CoreData
import PKHUD

protocol DataUpdated {
    func documentsUpdated()
}

class NewDocumentViewController: UIViewController {

    var delegate: DataUpdated?
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var documentTextView: UITextView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var boldButton: RoundedCornerButton!
    @IBOutlet weak var italicButton: RoundedCornerButton!
    @IBOutlet weak var underlineButton: RoundedCornerButton!
    @IBOutlet weak var colorButton: RoundedCornerButton!
    
    @IBOutlet weak var leftAlignButton: RoundedCornerButton!
    @IBOutlet weak var centerAlignButton: RoundedCornerButton!
    @IBOutlet weak var rightAlignButton: RoundedCornerButton!
    
    var documentId: Int16 = -1
    var isNewDocument: Bool = false
    
    var documentContent: NSAttributedString = NSAttributedString(string: "")
    var isReaderView = false
    
    let dataManager: DataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        documentTextView.delegate = self
        documentTextView.attributedText = documentContent
        if isReaderView {
            bottomView.isHidden = true
            documentTextView.isEditable = false
            saveButton.setTitle("Share", for: .normal)
        } else {
            NotificationCenter.default.addObserver(self, selector:#selector(NewDocumentViewController.keyBoardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector:#selector(NewDocumentViewController.keyBoardWillHide(_:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        }
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
                let boldFont = UIFont.boldSystemFont(ofSize: (CGFloat)(15.0))
                var dict = documentTextView.typingAttributes
                dict.updateValue(boldFont, forKey: NSAttributedString.Key.font)
                documentTextView.textStorage.setAttributes(dict, range: documentTextView.selectedRange)
            } else {
                let changedFontDescriptor = UIFont.systemFont(ofSize: (CGFloat)(15.0))
                let typ = documentTextView.typingAttributes[NSAttributedString.Key.font] as? UIFont
                if ( typ == changedFontDescriptor) {
                    self.documentTextView.typingAttributes[NSAttributedString.Key.font] = UIFont.boldSystemFont(ofSize: (CGFloat)(15))
                    boldButton.backgroundColor = .lightGray
                }else {
                    self.documentTextView.typingAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: (CGFloat)(15))
                    boldButton.backgroundColor = .clear
                }
            }
        }
    }
    
    @IBAction func italicButtonClicked(_ sender: Any) {
        if let range = documentTextView.selectedTextRange {
            let selectedText = documentTextView.text(in: range)
            if selectedText!.count > 0 {
                var dict = documentTextView.typingAttributes
                dict.updateValue(0.5, forKey: NSAttributedString.Key.obliqueness)
                documentTextView.textStorage.setAttributes(dict, range: documentTextView.selectedRange)
            } else {
                let typ = documentTextView.typingAttributes[NSAttributedString.Key.obliqueness] as? NSNumber
                if typ == 0.5 {
                    documentTextView.typingAttributes[NSAttributedString.Key.obliqueness] = 0
                    italicButton.backgroundColor = .clear
                }else {
                    documentTextView.typingAttributes[NSAttributedString.Key.obliqueness] = 0.5
                    italicButton.backgroundColor = .lightGray
                }
            }
        }
    }
    
    @IBAction func underlineButtonClicked(_ sender: Any) {
        if let range = documentTextView.selectedTextRange {
            let selectedText = documentTextView.text(in: range)
            if selectedText!.count > 0 {
                var dict = documentTextView.typingAttributes
                dict.updateValue(1, forKey: NSAttributedString.Key.underlineStyle)
                documentTextView.textStorage.setAttributes(dict, range: documentTextView.selectedRange)
            } else {
                let typ = documentTextView.typingAttributes[NSAttributedString.Key.underlineStyle] as? NSNumber
                if (typ == 1) {
                    self.documentTextView.typingAttributes[NSAttributedString.Key.underlineStyle] = 0
                    underlineButton.backgroundColor = .clear
                } else {
                    self.documentTextView.typingAttributes[NSAttributedString.Key.underlineStyle] = 1
                    underlineButton.backgroundColor = .lightGray
                }
            }
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
            
            let newParagraphStyle = NSMutableParagraphStyle.init()
            newParagraphStyle.alignment = newAlignmnet
            var dict = documentTextView.typingAttributes
            dict.updateValue(newParagraphStyle, forKey: NSAttributedString.Key.paragraphStyle)
            
            if selectedText!.count > 0 {
                documentTextView.textStorage.beginEditing()
                documentTextView.textStorage.setAttributes(dict, range: documentTextView.selectedRange)
                documentTextView.textStorage.endEditing()
            } else {
                documentTextView.typingAttributes = dict
            }
        }
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if isReaderView {
            doShareDocument(sender)
        } else {
            self.view.endEditing(true)
            if isNewDocument {
                doSaveDocument()
            } else {
                //update document
                doUpdateDocument()
            }
        }
    }
    
    private func doSaveDocument() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Document", in: context)
        let newDocument = NSManagedObject(entity: entity!, insertInto: context)
 
        let attributedString = documentTextView.attributedText
        var lines: [String] = documentTextView.text.components(separatedBy: NSCharacterSet.newlines)
        let date = Date()
        
        if lines.count > 3 {
            
            newDocument.setValue(documentId, forKey: "docid")
            newDocument.setValue(attributedString, forKey: "content")
            newDocument.setValue(date, forKey: "date")
            newDocument.setValue(lines[0], forKey: "title")
            newDocument.setValue(lines[1], forKey: "writer")
 
            do {
                try context.save()
                //show save successful message
                showSuccessDialog()
                //notify parent view controller that database changed
                
            } catch {
                print("Failed saving")
            }
        } else {
            print("document is not complete")
        }
    }
    
    private func doUpdateDocument() {
        print("update document button tapped")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            //let doc = try context.fetch(fetchRequest)
            let doc = try dataManager.fetchDocuments(withId: documentId)
            
            if doc.count > 0 {
                var lines: [String] = documentTextView.text.components(separatedBy: NSCharacterSet.newlines)
                
                if lines.count > 3 {
                    
                    let updatedDoc = doc[0] as NSManagedObject
                    
                    let attributedString = documentTextView.attributedText
                    let date = Date()
                    
                    updatedDoc.setValue(attributedString, forKey: "content")
                    updatedDoc.setValue(date, forKey: "date")
                    updatedDoc.setValue(lines[0], forKey: "title")
                    updatedDoc.setValue(lines[1], forKey: "writer")
                    
                    do {
                        try context.save()
                        //show save successful message
                        showSuccessDialog()
                        //notify parent view controller that database changed
                    } catch {
                        print("Failed saving")
                    }
                } else {
                    print("document is not complete")
                }
            }
            
        } catch {
            
        }
    }
    
    private func doShareDocument(_ sender: Any) {
        print("Share button tapped")
        let firstActivityItem = documentTextView.attributedText
        
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem?.string as Any], applicationActivities: nil)
        
        // This lines is for the popover you need to show in iPad
        activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
        
        // This line remove the arrow of the popover to show in iPad
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
        
        // Anything you want to exclude
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func showSuccessDialog() {
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 1.0) { success in
            // Completion Handler
            self.delegate?.documentsUpdated()
            self.dismiss(animated: true, completion: nil)
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
