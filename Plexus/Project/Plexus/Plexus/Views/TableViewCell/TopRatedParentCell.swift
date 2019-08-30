//
//  TopRatedParentCell.swift
//  Plexus
//
//  Created by Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TopRatedParentCell: UITableViewCell {

    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    var topRatedList:[Course] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TopRatedParentCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topRatedCell", for: indexPath) as! TopRatedCell
        if topRatedList.count > 0 {
            let course = topRatedList[indexPath.row]
            cell.courseDetailLabel.text = course.description
            cell.courseImageView.image = UIImage(named: course.imageName!)
            cell.ratingView.rating = Double(course.rating!)
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topRatedList.count
    }
    
}
