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
    let newsList: [NewsEntity] = [NewsEntity(newsID: 1, detail: "You can’t fall if you don’t climb. But there’s no joy in living your whole life on the ground.", imageName: "nolan", repoterName: "Bernard Nolan", date: "16 Nov"),
    NewsEntity(newsID: 2, detail: "If you’re offered a seat on a rocket ship, don’t ask what seat! Just get on.", imageName: "stone", repoterName: "Adrien Stone", date: "17 Nov")]
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension OnTripCategoryNewsCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let news = newsList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        cell.dateLabel.text = news.date
        cell.repoterNameLabel.text = news.repoterName
        cell.detailTextLabel.text = news.detail
        cell.imageView.image = UIImage(named: news.imageName)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
}
