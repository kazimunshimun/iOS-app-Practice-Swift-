//
//  MenuDataSource.swift
//  SocialMeetUp
//
//  Created by Anik on 4/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class MenuDataSource : GenericDataSource<Menu>, UICollectionViewDataSource {
    
    // MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menu = data.value[indexPath.row]
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuProfileCell", for: indexPath) as! MenuProfileCell
            cell.menuNameLabel.text = menu.name
            cell.menuImageView.image = UIImage(named: menu.image)
            //cell.menuBackgroundView.borderColor = menu.isSelected ? menu.menuSelectedColor : ColorUtils.hexStringToUIColor(hex: "#979797")
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
        return data.value.count
    }
    
}
