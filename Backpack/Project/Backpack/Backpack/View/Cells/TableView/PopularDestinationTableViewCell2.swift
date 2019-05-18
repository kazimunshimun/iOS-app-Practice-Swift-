//
//  PopularDestinationTableViewCell2.swift
//  Backpack
//
//  Created by Anik on 14/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class PopularDestinationTableViewCell2: UITableViewCell {
    
    var destinationArray : [PopularDestination] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}

extension PopularDestinationTableViewCell2 : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "destinationCell", for: indexPath) as! DestinationCollectionViewCell
        cell.imageView.image = UIImage(named: destinationArray[indexPath.row].image)
        cell.nameLabel.text = destinationArray[indexPath.row].name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return destinationArray.count
    }
    
}
