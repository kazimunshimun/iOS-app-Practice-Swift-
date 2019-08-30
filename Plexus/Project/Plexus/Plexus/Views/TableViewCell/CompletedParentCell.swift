//
//  CompletedParentCell.swift
//  Plexus
//
//  Created by Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class CompletedParentCell: UITableViewCell {

    @IBOutlet weak var completedCollectionView: UICollectionView!
    var completedList: [CopmpletedCourse] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CompletedParentCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "completedCell", for: indexPath) as! CompletedCell
        if completedList.count > 0 {
            let course = completedList[indexPath.row]
            cell.courseImageView.image = UIImage(named: course.imageName!)
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return completedList.count
    }
    
}
