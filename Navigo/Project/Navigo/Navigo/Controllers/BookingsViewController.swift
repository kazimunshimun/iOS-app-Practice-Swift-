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
    
    var bookings: [BookingEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateMap()
        updateViews()
        
        self.bookingTableView.register(UINib(nibName: "BookingCell", bundle: nil), forCellReuseIdentifier: "bookingCell")
        self.bookingTableView.delegate = self
        self.bookingTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        roundedParentView.topLeft = true
        roundedParentView.topRight = true
    }
    
    func updateViews() {
        DispatchQueue.global(qos: .userInitiated).async {
            BookingData.shared.getBookings() { bookings in
                DispatchQueue.main.async {
                    self.bookings = bookings
                    self.bookingTableView.reloadData()
                    self.addBookingPlacesInMap()
                }
            }
        }
    }
    
    func mapCameraFocusOnFirstBooking(booking: BookingEntity) {
        mapView.animate(to: GMSCameraPosition(latitude: booking.location.coordinate.latitude, longitude: booking.location.coordinate.longitude, zoom: 18.0))
    }
    
    func addBookingPlacesInMap() {
        mapCameraFocusOnFirstBooking(booking: bookings[0])
        for place in bookings {
            var markerImage = ""
            if place.type == .meeting {
                markerImage = "meeting_icon"
            } else {
                markerImage = "dinner_icon"
            }
            
            let marker = addMarkerToMap(title: place.name, snippet: "", location: CLLocationCoordinate2D(latitude: place.location.coordinate.latitude, longitude: place.location.coordinate.longitude), markerImageName: markerImage)
            marker.map = mapView
        }
    }
    
    func addMarkerToMap(title: String, snippet: String, location: CLLocationCoordinate2D, markerImageName: String) -> GMSMarker {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        marker.title = title
        marker.snippet = snippet
        marker.icon = UIImage(named: markerImageName)
        return marker
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
        mapCameraFocusOnFirstBooking(booking: bookings[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 120.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookingCell", for: indexPath) as! BookingCell
        if bookings.count > 0 {
            let booking = self.bookings[indexPath.row]
            cell.timeLabel.text = booking.timeDate
            if booking.type == .meeting {
                cell.typeImageView.image = UIImage(named: "meeting_icon")
                cell.image1View.cornerRadius = 19
                cell.image2View.cornerRadius = 19
                cell.image3View.cornerRadius = 19
            } else {
                cell.typeImageView.image = UIImage(named: "dinner_icon")
                cell.image1View.cornerRadius = 8
                cell.image2View.cornerRadius = 8
                cell.image3View.cornerRadius = 8
            }
            
            let typeString: String = booking.type.rawValue
            cell.nameLabel.text = "\(typeString.uppercased()) at \(booking.name)"
            cell.image1View.image = UIImage(named: booking.imagesName[0])
            cell.image2View.image = UIImage(named: booking.imagesName[1])
            cell.image3View.image = UIImage(named: booking.imagesName[2])
        }
        return cell
    }
}
