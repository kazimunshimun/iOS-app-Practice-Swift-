//
//  OnTripCategoryCell.swift
//  Navigo
//
//  Created by Anik on 3/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class OnTripCategoryCell: UITableViewCell {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var categoryName: UILabel!
    var section: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        /*
        if let flowLayout = categoryCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let width : CGFloat
            let height : CGFloat
            
            if section == 1 {
                width = 350
                height = 144
            } else {
                width = 240
                height = 320
            }
            flowLayout.itemSize = CGSize(width: width, height: height)
        }
 */
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension OnTripCategoryCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "musicCell", for: indexPath) as! MusicCell
        return cell
    }
    
    
    /*
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width : CGFloat
        let height : CGFloat
        
        if section == 1 {
            width = 350
            height = 144
        } else {
            width = 240
            height = 320
        }
        return CGSize(width: width, height: height)
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
}
