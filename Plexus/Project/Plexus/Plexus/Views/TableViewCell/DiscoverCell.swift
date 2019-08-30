//
//  DiscoverCell.swift
//  Plexus
//
//  Created by Anik on 20/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class DiscoverCell: UITableViewCell {

    @IBOutlet weak var discoverCollectionView: UICollectionView!
    var discoverList:[Course] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension DiscoverCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "courseCell", for: indexPath) as! CourseCell
        if discoverList.count > 0 {
            cell.categoryLabel.text = discoverList[indexPath.row].category
            cell.courseDetailLabel.text = discoverList[indexPath.row].description
            cell.courseImageView.image = UIImage(named: discoverList[indexPath.row].imageName!)
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discoverList.count
    }
    
}
