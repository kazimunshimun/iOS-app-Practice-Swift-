//
//  ProfileViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class ProfileViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var contentView: RoundedCornerView!
    @IBOutlet weak var profileMenuView: RoundedCornerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
    }
    
    override func viewDidLayoutSubviews() {
        contentView.topLeft = true
        contentView.topRight = true
        
        profileMenuView.topLeft = true
        profileMenuView.topRight = true
        profileMenuView.bottomLeft = true
        profileMenuView.bottomRight = true
        
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
