//
//  PlaceDetailViewController.swift
//  Navigo
//
//  Created by Anik on 13/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import GoogleMaps

protocol VisitPlaceDelegate {
    func goToPlace(place: PlacesEntity)
}

class PlaceDetailViewController: UIViewController {

    @IBOutlet weak var mapParentView: RoundedCornerView!
    @IBOutlet weak var mapView: GMSMapView!
    var place: PlacesEntity!
    
    var placeDelegate: VisitPlaceDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        //navigationController!.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        mapParentView.topRight = true
        mapParentView.topLeft = true
        mapParentView.bottomRight = true
        mapParentView.bottomLeft = true
    }
    
    func updateViews() {
        let camera = GMSCameraPosition.camera(withLatitude: place.location.coordinate.latitude, longitude: place.location.coordinate.longitude, zoom: 16.0)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: place.location.coordinate.latitude, longitude: place.location.coordinate.longitude)
        marker.title = place.name
        marker.snippet = place.name
        marker.icon = UIImage(named: "resturent_marker")
        marker.map = mapView
    }
    
    
    @IBAction func goThereButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        placeDelegate?.goToPlace(place: place)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
