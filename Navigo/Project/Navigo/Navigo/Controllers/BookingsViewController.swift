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
                }
            }
        }
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
