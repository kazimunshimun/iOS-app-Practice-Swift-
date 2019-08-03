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
    let musicList: [MusicEntity] = [MusicEntity(musicID: 1, name: "Wild west", imageName: "wild_west", singerName: "Robin Stark"), MusicEntity(musicID: 2, name: "Thoughts", imageName: "thoughts", singerName: "John Brown")]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension OnTripCategoryCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let music = musicList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "musicCell", for: indexPath) as! MusicCell
        cell.name.text = music.name
        cell.imageView.image = UIImage(named: music.imageName)
        cell.musicianLabel.text = music.singerName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
}
