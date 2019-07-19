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

protocol VisitNearByPlaceDelegate {
    func goToNearByPlace(place: PlacesEntity)
}

class Nearby: UIViewController, Panelable, UITableViewDelegate, UITableViewDataSource, VisitPlaceDelegate {

    var placeDelegate: VisitNearByPlaceDelegate? = nil
    
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerPanel: UIView!
    
    @IBOutlet weak var topColorView: RoundedCornerView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var fullLabel: UILabel!
    @IBOutlet weak var indicatorImageView: UIImageView!
    @IBOutlet weak var nearbyTableView: UITableView!
    @IBOutlet weak var nearbyCountLabel: UILabel!
    
    let category: [String] = ["Sushi", "Soup", "Burger"]
    var places: [PlacesEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    override func viewDidLayoutSubviews() {
        topColorView.topLeft = true
        topColorView.topRight = true
    }
    
    func updateViews() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            PlaceData.shared.getPlaces() { places in
                DispatchQueue.main.async {
                    self.places = places
                    self.nearbyCountLabel.text = "\(places.count)"
                    self.nearbyTableView.delegate = self
                    self.nearbyTableView.dataSource = self
                }
            }
        }
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
        if places.count > 0 {
            cell.placesArray = Array(places[initalIndex..<finalIndex])
        }
        cell.nearByVC = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func goToPlace(place: PlacesEntity) {
        print("go to place from nearby vc")
        placeDelegate?.goToNearByPlace(place: place)
    }

}
