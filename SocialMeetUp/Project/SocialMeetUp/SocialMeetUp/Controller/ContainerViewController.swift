//
//  ContainerViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 21/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

protocol MenuPageDelegate {
    func numberOfPage(count: Int)
    func selectedPageIndex(index: Int)
}

class ContainerViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate  {
    
    
    var pageDelegate: MenuPageDelegate? = nil
    
    var menuList: [Menu] = []
    
    lazy var orderedViewController: [UIViewController] = {
        loadMenus()
        print("menu list count: \(self.menuList.count)")
        
        var viewControllers: [UIViewController] = []
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        
        for n in 0..<self.menuList.count {
            if n == 0 {
                let profileViewController = storyBoard.instantiateViewController(withIdentifier: "profileView") as! ProfileViewController
                viewControllers.append(profileViewController)
            } else {
                let feedViewController = storyBoard.instantiateViewController(withIdentifier: "feedTableView") as! FeedViewController
                feedViewController.menuItem = self.menuList[n]
                viewControllers.append(feedViewController)
            }
        }
        
        return viewControllers
    }()
    
    func loadMenus() {
        MenuData.shared.getMenus() { menus in
            self.menuList = menus
        }
    }
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return (storyboard?.instantiateViewController(withIdentifier: identifier))!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            //pageDelegate?.selectedPageIndex(index: orderedViewController.count - 1)
            return nil
        }
        guard orderedViewController.count > previousIndex else { return nil }
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        pageDelegate?.selectedPageIndex(index: viewControllerIndex)
        let nextIndex = viewControllerIndex + 1
        guard orderedViewController.count > nextIndex else { return nil }
        return orderedViewController[nextIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.dataSource = self
        self.delegate = self
        
        pageDelegate?.numberOfPage(count: orderedViewController.count)
        
        if let firstVC = orderedViewController.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
}
