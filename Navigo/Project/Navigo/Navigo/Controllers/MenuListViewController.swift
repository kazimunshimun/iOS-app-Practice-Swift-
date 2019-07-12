//
//  MenuListViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class MenuListViewController: MenuViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    let menuList = ["Home", "Bookings", "Places", "Contact Us", "About Us"]
    let menuImageNameList = ["home_icon", "booking_icon", "places3_icon", "contact_icon", "about_icon", "privacy_icon"]
    
    @IBOutlet weak var profileView: RoundedCornerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMenuList()
    }
    
    func setupMenuList() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.profileViewTouched))
        profileView.addGestureRecognizer(gesture)
        
        self.menuTableView.register(UINib(nibName: "MenuWithImageAndTextCell", bundle: nil), forCellReuseIdentifier: "menuImageTextCell")
        
        self.menuTableView.register(UINib(nibName: "MenuWithImageCell", bundle: nil), forCellReuseIdentifier: "menuImageCell")
        //MenuWithImageCell
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
    }
    
    @objc func profileViewTouched() -> Void {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }

        menuContainerViewController.selectContentViewController(menuContainerViewController.contentViewControllers[0])
        menuContainerViewController.hideSideMenu()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
    menuContainerViewController.selectContentViewController(menuContainerViewController.contentViewControllers[indexPath.row + 1])
        menuContainerViewController.hideSideMenu()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // let cellWidth : CGFloat = 64.0;
        let cellWidth : CGFloat = 80.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuImageNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuImageTextCell", for: indexPath) as! MenuWithImageAndTextCell
        cell.menuImageView.image = UIImage(named: menuImageNameList[indexPath.row])
        cell.menuNameLabel.text = menuList[indexPath.row]
        */
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuImageCell", for: indexPath) as! MenuWithImageCell
        cell.menuImageView.image = UIImage(named: menuImageNameList[indexPath.row])
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#454F63")
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }

}
