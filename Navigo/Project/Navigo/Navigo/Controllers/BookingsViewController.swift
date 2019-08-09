//
//  BookingsViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import GoogleMaps

class BookingsViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var roundedParentView: RoundedCornerView!
    @IBOutlet weak var bookingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateMap()
        
        self.bookingTableView.register(UINib(nibName: "BookingCell", bundle: nil), forCellReuseIdentifier: "bookingCell")
        self.bookingTableView.delegate = self
        self.bookingTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        roundedParentView.topLeft = true
        roundedParentView.topRight = true
    }
    
    func updateMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 51.4942188, longitude: -0.1725956, zoom: 16.0)
        mapView.camera = camera
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
    }

}

extension BookingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 120.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookingCell", for: indexPath) as! BookingCell
        
        
        return cell
    }
}
