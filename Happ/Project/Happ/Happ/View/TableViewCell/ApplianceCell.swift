//
//  ApplianceCell.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

protocol ApplianceSelectedDelegate {
    func seeAllSelected()
    func applianceSelected(appliance: Appliance)
}

class ApplianceCell: UITableViewCell {

    var applianceDelegate: ApplianceSelectedDelegate?
    
    @IBOutlet weak var applianceCollectionView: UICollectionView!
    
    var items:[Appliance] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        applianceCollectionView.register(UINib(nibName: "ApplianceItemCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        applianceCollectionView.dataSource = self
        applianceCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func seeAllButtonClicked(_ sender: Any) {
        applianceDelegate?.seeAllSelected()
    }
}

extension ApplianceCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ApplianceItemCell
        if items.count > 0 {
            let appliance = items[indexPath.row]
            cell.itemTitle.text = appliance.name
            cell.itemImageView.image = UIImage(named: appliance.imageName!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if items.count > 0 {
            applianceDelegate?.applianceSelected(appliance: items[indexPath.row])
        }
    }

}
