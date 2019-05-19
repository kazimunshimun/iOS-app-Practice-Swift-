//
//  OnboardParentViewController.swift
//  Backpack
//
//  Created by Anik on 18/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class OnboardParentViewController: UIViewController, OnBoardingDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    var childViewController: OnBoardingViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
        //timer = Timer(timeInterval: 5, target: self, selector: #selector(changeView), userInfo: nil, repeats: true)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
        
    }
    
    // Prepare the segue(Embed Segue) to UIPageViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let onboardingViewController = segue.destination as?
            OnBoardingViewController {
            childViewController = onboardingViewController
            onboardingViewController.pageDelegate = self
        }
    }
    
    func numberOfPage(count: Int) {
        pageControl.numberOfPages = count
    }
    
    func selectedPageIndex(index: Int) {
        pageControl.currentPage = index
    }

    @IBAction func skipButtonPressed(_ sender: Any) {
        self.showSpinner(onView: self.view, showText: false, text: "", position: .center)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.removeSpinner()
            let storyboard = UIStoryboard(name: "TabMenu", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "tabMenuController") as! MenuViewController
            self.show(vc, sender: nil)
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        var index = pageControl.currentPage + 1
        //print("requesting for view controller of page: \(index) totalPage: \(pageControl.numberOfPages)")
        if index == pageControl.numberOfPages {
            index = 0
        }
        if let desiredVC = self.childViewController?.orderedViewController[index] {
            childViewController?.setViewControllers([desiredVC], direction: .forward, animated: true, completion: nil)
            pageControl.currentPage = index
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
