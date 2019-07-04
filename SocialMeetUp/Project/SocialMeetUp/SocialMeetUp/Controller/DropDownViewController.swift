//
//  DropDownViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 18/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import ViewAnimator

protocol DropdownMenuDelegate {
    func selectedMenuIndex(index: IndexPath)
}

class DropDownViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let animations = [AnimationType.from(direction: .right, offset: 30.0)]
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    var menuList: [Menu] = []
    
    let numberOfCellsPerRow: CGFloat = 1
    
    var menuDelegate: DropdownMenuDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        loadMenus()
        
        if let flowLayout = menuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let horizontalSpacing = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
            let cellWidth = (view.frame.width - max(0, numberOfCellsPerRow - 1)*horizontalSpacing)/numberOfCellsPerRow
            flowLayout.itemSize = CGSize(width: cellWidth, height: 90)
        }
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
        UIView.animate(views: self.menuCollectionView.visibleCells, animations: self.animations, completion: nil)
    }
    
    // MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menu = menuList[indexPath.row]
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuProfileCell1", for: indexPath) as! MenuProfileCell
            cell.menuNameLabel.text = menu.name
            cell.menuImageView.image = UIImage(named: menu.image)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell1", for: indexPath) as! MenuCell
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
        //self.navigationController?.dismiss(animated: true)
        menuDelegate?.selectedMenuIndex(index: indexPath)
        dismiss(animated: true, completion: nil)
    }

}
