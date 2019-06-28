//
//  AddNewViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import GoogleMaps

class AddNewViewController: UIViewController {

    @IBOutlet weak var groupNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var descriptionTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var locationRoundedCornerView: RoundedCornerView!
    @IBOutlet weak var interestView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateLocationView()
    }
    
    override func viewDidLayoutSubviews() {
        locationRoundedCornerView.topRight = true
        locationRoundedCornerView.bottomLeft = true
    }
    
    func updateLocationView() {
        let camera = GMSCameraPosition.camera(withLatitude: 45.5303, longitude: -73.749, zoom: 14.0)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 45.5303, longitude: -73.749)
        marker.icon = UIImage(named: "map_pin")
        marker.map = mapView
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
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
