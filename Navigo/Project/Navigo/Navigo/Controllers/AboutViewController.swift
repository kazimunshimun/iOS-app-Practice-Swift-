//
//  AboutViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class AboutViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var descriptionView: RoundedCornerView!
    @IBOutlet weak var infoView: RoundedCornerView!
    @IBOutlet weak var creatorCollectionView: UICollectionView!
    
    var creatorList : [CreatorEntity] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        DispatchQueue.global(qos: .userInitiated).async {
            CreatorData.shared.getCreators() { creators in
                DispatchQueue.main.async {
                    self.creatorList = creators
                    self.creatorCollectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        descriptionView.topLeft = true
        descriptionView.topRight = true
        descriptionView.bottomLeft = true
        descriptionView.bottomRight = true
        
        infoView.topLeft = true
        infoView.topRight = true
        infoView.bottomLeft = true
        infoView.bottomRight = true
        
        let indexPath = IndexPath(item: 1, section: 0)
        self.creatorCollectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
    }

}

extension AboutViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "creatorCell", for: indexPath) as! CreatorCell
        if creatorList.count > 0 {
            let creator = creatorList[indexPath.row]
            cell.imageView.image = UIImage(named: creator.imagesName)
            cell.nameLabel.text = creator.name
            cell.roleLabel.text = creator.role
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return creatorList.count
    }
}
