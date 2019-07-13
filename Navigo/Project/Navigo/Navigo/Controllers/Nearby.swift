//
//  NearbyViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Panels
import UIKit

class Nearby: UIViewController, Panelable, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerPanel: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var fullLabel: UILabel!
    @IBOutlet weak var topMultiColorView: UIView!
    @IBOutlet weak var indicatorImageView: UIImageView!
    @IBOutlet weak var nearbyTableView: UITableView!
    
    let places: [PlacesEntity] = [PlacesEntity(categoryID: 0, placeID: 1, name: "Sushi Place", imageName: "sushi_place_1", distance: 2.2, rating: 4.5), PlacesEntity(categoryID: 0, placeID: 2, name: "Nom Nom", imageName: "sushi_place_2", distance: 1.2, rating: 4.0), PlacesEntity(categoryID: 0, placeID: 3, name: "Palace", imageName: "sushi_place_3", distance: 4.2, rating: 4.3),
    PlacesEntity(categoryID: 0, placeID: 1, name: "Pho Montreal", imageName: "soup_place_1", distance: 2.2, rating: 4.5), PlacesEntity(categoryID: 0, placeID: 2, name: "Rigolati", imageName: "soup_place_2", distance: 1.2, rating: 4.0), PlacesEntity(categoryID: 0, placeID: 3, name: "Dae Jang Geum", imageName: "soup_place_3", distance: 4.2, rating: 4.3),
    PlacesEntity(categoryID: 0, placeID: 1, name: "Time Out", imageName: "burger_place_1", distance: 2.2, rating: 4.5), PlacesEntity(categoryID: 0, placeID: 2, name: "Tree House", imageName: "burger_place_2", distance: 1.2, rating: 4.0), PlacesEntity(categoryID: 0, placeID: 3, name: "Cozy Sizzler", imageName: "burger_place_3", distance: 4.2, rating: 4.3)]
    let category: [String] = ["Sushi", "Soup", "Burger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        nearbyTableView.delegate = self
        nearbyTableView.dataSource = self
    }
    
    public func updateTopView(isBottom: Bool) {
        bottomView.isHidden = isBottom
        fullLabel.isHidden = !isBottom
        topMultiColorView.isHidden = isBottom ? true : false
        indicatorImageView.image = isBottom ? UIImage(named: "back_icon") : UIImage(named: "up_icon")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
        cell.categoryName.text = category[indexPath.row]
        let initalIndex = indexPath.row * 3
        let finalIndex = initalIndex + 3
        cell.placesArray = Array(places[initalIndex..<finalIndex])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
