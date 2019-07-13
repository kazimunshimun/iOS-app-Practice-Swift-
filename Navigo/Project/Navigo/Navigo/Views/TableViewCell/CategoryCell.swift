//
//  PlacesCell.swift
//  Navigo
//
//  Created by Anik on 13/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    var placesArray : [PlacesEntity] = []
    var nearByVC: UIViewController?
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}

extension CategoryCell : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "placesCell", for: indexPath) as! PlacesCell
        cell.imageView.image = UIImage(named: placesArray[indexPath.row].imageName)
        cell.nameLabel.text = placesArray[indexPath.row].name
        cell.infoLabel.text = "\(placesArray[indexPath.row].distance)mi, \(placesArray[indexPath.row].rating) stars"
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collection view item selected")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Nearby", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "placeDetailView") as! PlaceDetailViewController
        nearByVC?.show(detailViewController, sender: nil)
    }
}
