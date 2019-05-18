//
//  OnBoardingViewController.swift
//  Backpack
//
//  Created by Anik on 18/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

protocol OnBoardingDelegate {
    func numberOfPage(count: Int)
    func selectedPageIndex(index: Int)
}

class OnBoardingViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    enum PageViews: String {
        case addTrips
        case discover
        case invites
        case askOut
    }
    
    var pageDelegate: OnBoardingDelegate? = nil
    
    lazy var orderedViewController: [UIViewController] = {
        return [self.getViewController(withIdentifier: PageViews.addTrips.rawValue),
                self.getViewController(withIdentifier: PageViews.discover.rawValue),
                self.getViewController(withIdentifier: PageViews.invites.rawValue),
                self.getViewController(withIdentifier: PageViews.askOut.rawValue)]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return (storyboard?.instantiateViewController(withIdentifier: identifier))!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            //pageDelegate?.selectedPageIndex(index: orderedViewController.count - 1)
            return orderedViewController.last
        }
        guard orderedViewController.count > previousIndex else { return nil }
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.index(of: viewController) else { return nil }
        pageDelegate?.selectedPageIndex(index: viewControllerIndex)
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < orderedViewController.count else {
            //pageDelegate?.selectedPageIndex(index: 0)
            return orderedViewController.first
        }
        guard orderedViewController.count > nextIndex else { return nil }
        return orderedViewController[nextIndex]
    }
    
    func presentationCount(for: UIPageViewController) -> Int {
        return orderedViewController.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
