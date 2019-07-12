//
//  MenuHostViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class MenuHostViewController: MenuContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMenu()
        
    }
    
    func updateMenu() {
        self.menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "menuView") as? MenuViewController
        
        self.contentViewControllers = contentControllers()
        self.selectContentViewController(contentViewControllers.first!)
        self.currentItemOptions.cornerRadius = 12.0
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.transitionOptions = TransitionOptions(duration: 0.7, visibleContentWidth: screenSize.width - 88.0)
        self.transitionOptions.contentScale = 0.92
    }

    private func contentControllers() -> [UIViewController] {
        var contentList = [UIViewController]()
        let hometoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeViewController = hometoryBoard.instantiateViewController(withIdentifier: "homeView") 
        contentList.append(homeViewController)
        return contentList
    }
}
