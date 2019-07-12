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
    }

    private func contentControllers() -> [UIViewController] {
        var contentList = [UIViewController]()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeViewController = storyBoard.instantiateViewController(withIdentifier: "homeView") as! UIViewController
        contentList.append(homeViewController)
        return contentList
    }
}
