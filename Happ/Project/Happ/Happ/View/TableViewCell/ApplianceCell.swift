//
//  ApplianceCell.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ApplianceCell: UITableViewCell {

    @IBOutlet weak var applianceCollectionView: UICollectionView!
    
    let items = ["Air Conditioner", "Smart Light", "Refrigerator", "LED Bulb"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        applianceCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ApplianceCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ApplianceItemCell
        cell.itemTitle.text = items[indexPath.row]
        return cell
    }
    
    
}
