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
        self.selectContentViewController(contentViewControllers[1])
        self.currentItemOptions.cornerRadius = 12.0
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.transitionOptions = TransitionOptions(duration: 0.7, visibleContentWidth: screenSize.width - 88.0)
        self.transitionOptions.contentScale = 0.92
    }

    private func contentControllers() -> [UIViewController] {
        var contentList = [UIViewController]()
        
        let profileStoryBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let profileViewController = profileStoryBoard.instantiateViewController(withIdentifier: "profileView")
        contentList.append(profileViewController)
        
        let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeViewController = homeStoryBoard.instantiateViewController(withIdentifier: "homeView")
        contentList.append(homeViewController)
        
        let bookingStoryBoard: UIStoryboard = UIStoryboard(name: "Bookings", bundle: nil)
        let bookingViewController = bookingStoryBoard.instantiateViewController(withIdentifier: "bookingsView")
        contentList.append(bookingViewController)
        
        let placesStoryBoard: UIStoryboard = UIStoryboard(name: "Places", bundle: nil)
        let placesViewController = placesStoryBoard.instantiateViewController(withIdentifier: "placesView")
        contentList.append(placesViewController)
        
        let aboutStoryBoard: UIStoryboard = UIStoryboard(name: "About", bundle: nil)
        
        let contactViewController = aboutStoryBoard.instantiateViewController(withIdentifier: "contactView")
        contentList.append(contactViewController)
        
        let aboutViewController = aboutStoryBoard.instantiateViewController(withIdentifier: "aboutView")
        contentList.append(aboutViewController)
        
        let privacyViewController = aboutStoryBoard.instantiateViewController(withIdentifier: "privacyView")
        contentList.append(privacyViewController)
        
        return contentList
    }
}
