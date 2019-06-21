//
//  MenuViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 16/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
//import Hero

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MenuPageDelegate {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    @IBOutlet weak var createNewButton: RoundedCornerButton!
    
    var previosSelectedIndex: Int = -1
    
    var menuList: [Menu] = []
    
    var childViewController: ContainerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        loadMenus()
    }
    
    @IBAction func dropDownButtonClicked(_ sender: Any) {
        print("show menu button pressed!")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let dropDownViewController = storyBoard.instantiateViewController(withIdentifier: "dropDownMenu") as! DropDownViewController
       // dropDownViewController.hero.isEnabled = true
       // dropDownViewController.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .down), dismissing: .slide(direction: .up))
        //self.show(dropDownViewController, sender: nil)
        present(dropDownViewController, animated: true, completion: nil)
    }
    
    func loadMenus() {
        DispatchQueue.global(qos: .userInitiated).async {
            MenuData.shared.getMenus() { menus in
                DispatchQueue.main.async {
                    self.menuList = menus
                    self.menuCollectionView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menu = menuList[indexPath.row]
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuProfileCell", for: indexPath) as! MenuProfileCell
            cell.menuNameLabel.text = menu.name
            cell.menuImageView.image = UIImage(named: menu.image)
            cell.menuBackgroundView.borderColor = menu.isSelected ? menu.menuSelectedColor : ColorUtils.hexStringToUIColor(hex: "#979797")
            //cell.menuBackgroundView.alpha = menu.isSelected ? 1.0 : 0.30
            cell.menuNameLabel.textColor = menu.isSelected ? .black : ColorUtils.hexStringToUIColor(hex: "#374750")
            cell.menuNameLabel.alpha = menu.isSelected ? 1.0 : 0.56
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
            cell.menuNameLabel.text = menu.name
            cell.menuImageView.image = UIImage(named: menu.image)
            cell.menuBackgroundView.borderColor = menu.isSelected ? menu.menuSelectedColor : ColorUtils.hexStringToUIColor(hex: "#979797")
            cell.menuBackgroundView.alpha = menu.isSelected ? 1.0 : 0.30
            cell.menuNameLabel.textColor = menu.isSelected ? .black : ColorUtils.hexStringToUIColor(hex: "#374750")
            cell.menuNameLabel.alpha = menu.isSelected ? 1.0 : 0.56
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    // MARK: - Collection View Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = menuList[indexPath.row]
        print("selected index: \(indexPath.row) menu: \(menu.name)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let onboardingViewController = segue.destination as?
            ContainerViewController {
            childViewController = onboardingViewController
            onboardingViewController.pageDelegate = self
        }
    }
    
    func numberOfPage(count: Int) {
        //pageControl.numberOfPages = count
    }
    
    func selectedPageIndex(index: Int) {
        //pageControl.currentPage = index
        print("selected menu index: \(index) previous selected index \(previosSelectedIndex)")
        if menuList.count > 0 {
            let selectedMenu = menuList[index]
            topView.backgroundColor = selectedMenu.menuSelectedColor
            menuList[index].isSelected = true
            if previosSelectedIndex == -1 {
                previosSelectedIndex = index
            }
            
            if previosSelectedIndex != index {
                menuList[previosSelectedIndex].isSelected = false
                previosSelectedIndex = index
            }
            self.menuCollectionView.reloadData()
        }
    }
}
