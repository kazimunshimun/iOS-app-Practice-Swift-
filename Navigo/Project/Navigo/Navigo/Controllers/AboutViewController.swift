//
//  AboutViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class AboutViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var descriptionView: RoundedCornerView!
    @IBOutlet weak var infoView: RoundedCornerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        descriptionView.topLeft = true
        descriptionView.topRight = true
        descriptionView.bottomLeft = true
        descriptionView.bottomRight = true
        
        infoView.topLeft = true
        infoView.topRight = true
        infoView.bottomLeft = true
        infoView.bottomRight = true
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
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
