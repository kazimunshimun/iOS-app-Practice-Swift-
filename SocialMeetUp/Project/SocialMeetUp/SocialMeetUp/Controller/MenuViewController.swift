//
//  MenuViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 16/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import Hero

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    @IBOutlet weak var createNewButton: RoundedCornerButton!
    
    var menuList: [Menu] = []
    
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
        dropDownViewController.hero.isEnabled = true
        dropDownViewController.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .down), dismissing: .slide(direction: .up))
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
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
            cell.menuNameLabel.text = menu.name
            cell.menuImageView.image = UIImage(named: menu.image)
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
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
//        let fullPostViewController = storyBoard.instantiateViewController(withIdentifier: "dropDownMenu") as! DropDownViewController
//        self.show(fullPostViewController, sender: nil)
//        collectionView.deselectItem(at: indexPath, animated: true)
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
