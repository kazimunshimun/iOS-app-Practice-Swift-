//
//  HomeViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import Panels

class HomeViewController: UIViewController, SideMenuItemContent {

    lazy var panelManager = Panels(target: self)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let screenSize: CGRect = UIScreen.main.bounds
        let panel = UIStoryboard.instantiatePanel(identifier: "Nearby")
        let panelConfiguration = PanelConfiguration(size: .custom(screenSize.height - 84))
        
        // To present the panel
        panelManager.show(panel: panel, config: panelConfiguration)
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
