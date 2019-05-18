//
//  SettingsViewController.swift
//  Backpack
//
//  Created by Anik on 21/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var deactiveAccountView: UIView!
    @IBOutlet weak var termsView: UIView!
    @IBOutlet weak var privacyView: UIView!
    @IBOutlet weak var aboutView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.showSpinner(onView: self.view, showText: true, position: .bottom)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.removeSpinner()
        }
        //deactiveAccountView.addTapGesture(tapNumber: 1, target: self, action: #selector(followersViewTouched))
        termsView.addTapGesture(tapNumber: 1, target: self, action: #selector(termViewTouched))
        privacyView.addTapGesture(tapNumber: 1, target: self, action: #selector(privacyViewTouched))
        aboutView.addTapGesture(tapNumber: 1, target: self, action: #selector(aboutViewTouched))
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @objc func termViewTouched() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let termsViewController = storyBoard.instantiateViewController(withIdentifier: "termsView")
        self.show(termsViewController, sender: nil)
    }
    
    @objc func privacyViewTouched() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let privacyViewController = storyBoard.instantiateViewController(withIdentifier: "privacyView")
        self.show(privacyViewController, sender: nil)
    }
    
    @objc func aboutViewTouched() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let aboutViewController = storyBoard.instantiateViewController(withIdentifier: "aboutView")
        self.show(aboutViewController, sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
