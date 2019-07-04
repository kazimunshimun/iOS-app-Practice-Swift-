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

class AddNewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var groupNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var descriptionTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var locationRoundedCornerView: RoundedCornerView!
    @IBOutlet weak var interestView: UIView!
    
    var imagePicker = UIImagePickerController()
    
    var groupImage: UIImage = UIImage()
    
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.showImagePickerView(sender:)))
        interestView.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLocationView()
    }
    
    override func viewDidLayoutSubviews() {
        locationRoundedCornerView.topRight = true
        locationRoundedCornerView.bottomLeft = true
    }
    
    func updateLocationView() {
        let camera = GMSCameraPosition.camera(withLatitude: 45.5303, longitude: -73.749, zoom: 14.0)
        mapView.camera = camera
        
        marker.position = CLLocationCoordinate2D(latitude: 45.5303, longitude: -73.749)
        marker.title = ""
        marker.snippet = ""
        marker.icon = UIImage(named: "map_pin")
        marker.isDraggable = true
        marker.map = mapView
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        marker.position = position.target
        let aGMSGeocoder: GMSGeocoder = GMSGeocoder()
        aGMSGeocoder.reverseGeocodeCoordinate(CLLocationCoordinate2DMake(marker.position.latitude, marker.position.longitude)) {
            (gmsResult, error) in
                if let gmsResultFirst = gmsResult?.firstResult() {
                    print("local: \(gmsResultFirst.locality) city: \(gmsResultFirst.administrativeArea)")
                    self.locationNameLabel.text = "\(gmsResultFirst.locality!), \(gmsResultFirst.administrativeArea!)"
                }
            }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func showImagePickerView(sender : UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            // print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        print("location lat: \(marker.position.latitude) long: \(marker.position.longitude)")
        let groupName = groupNameTextField.text
        let alertInfo = AlertMessage(title: "Group Created", description: locationNameLabel.text!, groupImageName: "", message: groupName, groupImage: groupImage)
        self.showSuccessDialog(onView: self.view, alertInfo: alertInfo)
        
        //dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        groupImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
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
