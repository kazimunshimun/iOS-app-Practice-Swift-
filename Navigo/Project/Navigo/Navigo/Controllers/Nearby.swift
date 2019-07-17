//
//  NearbyViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Panels
import UIKit
import CoreLocation

class Nearby: UIViewController, Panelable, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerPanel: UIView!
    
    @IBOutlet weak var topColorView: RoundedCornerView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var fullLabel: UILabel!
    @IBOutlet weak var indicatorImageView: UIImageView!
    @IBOutlet weak var nearbyTableView: UITableView!
    
    var places: [PlacesEntity] = [PlacesEntity(categoryID: 0, placeID: 1, name: "Sushi Place", imageName: "sushi_place_1", distance: 2.2, rating: 4.5, isShowing: false, location: CLLocation(latitude: 51.4976549, longitude: -0.2117534)), PlacesEntity(categoryID: 0, placeID: 2, name: "Nom Nom", imageName: "sushi_place_2", distance: 1.2, rating: 4.0, isShowing: false, location: CLLocation(latitude: 51.4970644, longitude: -0.2126093)), PlacesEntity(categoryID: 0, placeID: 3, name: "Palace", imageName: "sushi_place_3", distance: 4.2, rating: 4.3, isShowing: false, location: CLLocation(latitude: 51.4962299, longitude: -0.2106902)),
                                  PlacesEntity(categoryID: 0, placeID: 1, name: "Pho Montreal", imageName: "soup_place_1", distance: 2.2, rating: 4.5, isShowing: false, location: CLLocation(latitude: 51.4958147, longitude: -0.2086598)), PlacesEntity(categoryID: 0, placeID: 2, name: "Rigolati", imageName: "soup_place_2", distance: 1.2, rating: 4.0, isShowing: false, location: CLLocation(latitude: 51.4971387, longitude: -0.2130881)), PlacesEntity(categoryID: 0, placeID: 3, name: "Dae Jang Geum", imageName: "soup_place_3", distance: 4.2, rating: 4.3, isShowing: false, location: CLLocation(latitude: 51.4960969, longitude: -0.2087144)),
                                  PlacesEntity(categoryID: 0, placeID: 1, name: "Time Out", imageName: "burger_place_1", distance: 2.2, rating: 4.5, isShowing: false, location: CLLocation(latitude: 51.4979636, longitude: -0.2074568)), PlacesEntity(categoryID: 0, placeID: 2, name: "Tree House", imageName: "burger_place_2", distance: 1.2, rating: 4.0, isShowing: false, location: CLLocation(latitude: 51.4948706, longitude: -0.211411)), PlacesEntity(categoryID: 0, placeID: 3, name: "Cozy Sizzler", imageName: "burger_place_3", distance: 4.2, rating: 4.3, isShowing: false, location: CLLocation(latitude: 51.494379, longitude: -0.2103103))]
    let category: [String] = ["Sushi", "Soup", "Burger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    override func viewDidLayoutSubviews() {
        topColorView.topLeft = true
        topColorView.topRight = true
    }
    
    func updateViews() {
        nearbyTableView.delegate = self
        nearbyTableView.dataSource = self
    }
    
    public func updateTopView(isBottom: Bool) {
        bottomView.isHidden = isBottom
        fullLabel.isHidden = !isBottom
        topColorView.isHidden = isBottom ? true : false
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
        cell.nearByVC = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
