//
//  OnTripCategoryNewsCell.swift
//  Navigo
//
//  Created by Anik on 3/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class OnTripCategoryNewsCell: UITableViewCell {
    @IBOutlet weak var categoryName: UILabel!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension OnTripCategoryNewsCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
}
