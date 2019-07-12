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
    var panel = UIStoryboard.instantiatePanel(identifier: "Nearby") as! Nearby
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let screenSize: CGRect = UIScreen.main.bounds
        
        let panelConfiguration = PanelConfiguration(size: .custom(screenSize.height - 84))
        // To present the panel
        panelManager.delegate = self
        panelManager.show(panel: panel, config: panelConfiguration)
    }
    

    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
    }

}

extension HomeViewController: PanelNotifications {
    func panelDidPresented() {
        //print("Panel is presented")
        panel.updateTopView(isBottom: false)
    }
    
    func panelDidCollapse() {
        //print("Panel did collapse")
        panel.updateTopView(isBottom: false)
    }
    
    func panelDidOpen() {
        //print("Panel did open")
        panel.updateTopView(isBottom: true)
    }
}
