//
//  ProfileViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class ProfileViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var contentView: RoundedCornerView!
    @IBOutlet weak var profileMenuView: RoundedCornerView!
    @IBOutlet weak var collectionViewParentView: RoundedCornerView!
    @IBOutlet weak var postCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: postCollectionView.frame.width, height: 223)
        postCollectionView.collectionViewLayout = collectionViewFlowLayout
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
    }
    
    override func viewDidLayoutSubviews() {
        contentView.topLeft = true
        contentView.topRight = true
        
        profileMenuView.topLeft = true
        profileMenuView.topRight = true
        profileMenuView.bottomLeft = true
        profileMenuView.bottomRight = true
        
        collectionViewParentView.topLeft = true
        collectionViewParentView.topRight = true
        collectionViewParentView.bottomLeft = true
        collectionViewParentView.bottomRight = true
    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        /*
        if creatorList.count > 0 {
            let creator = creatorList[indexPath.row]
            cell.imageView.image = UIImage(named: creator.imagesName)
            cell.nameLabel.text = creator.name
            cell.roleLabel.text = creator.role
        }
 */
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
