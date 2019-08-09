//
//  ContactViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import GoogleMaps

class ContactViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var mapParentView: RoundedCornerView!
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateMap()
    }
    
    override func viewDidLayoutSubviews() {
        mapParentView.topRight = true
        mapParentView.topLeft = true
        mapParentView.bottomRight = true
        mapParentView.bottomLeft = true
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
