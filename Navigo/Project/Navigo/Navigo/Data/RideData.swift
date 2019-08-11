//
//  RideData.swift
//  Navigo
//
//  Created by Anik on 11/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import CoreLocation

final internal class RideData {
    static let shared = RideData()
    let title = ["taxi", "ridy", "autoM"]
    let imageNames = ["taxi_icon", "ridy_icon", "autoM_icon"]
    
    let locations = [CLLocationCoordinate2D(latitude: 51.484253, longitude: -0.219813),
                     CLLocationCoordinate2D(latitude: 51.484487, longitude: -0.222559),
                     CLLocationCoordinate2D(latitude: 51.488449, longitude: -0.222736),
                     CLLocationCoordinate2D(latitude: 51.486378, longitude: -0.224088),
                     CLLocationCoordinate2D(latitude: 51.488195, longitude: -0.220730),
                     CLLocationCoordinate2D(latitude: 51.486866, longitude: -0.218005),
                     CLLocationCoordinate2D(latitude: 51.488823, longitude: -0.218788),
                     CLLocationCoordinate2D(latitude: 51.487006, longitude: -0.218160),
                     CLLocationCoordinate2D(latitude: 51.486899, longitude: -0.221175)]
    
    let rotations: [CLLocationDegrees] = [0, -25, 0, -25, 65, -20, -25, 65, -30]
    
    func getRides(company: RideCompany, completion: ([RideEntity]) -> Void) {
        var rideList: [RideEntity] = []
        let startIndex = company.rawValue * 3
        let endIndex = startIndex + 3
        for i in startIndex..<endIndex {
            let ride = RideEntity(id: i, markerImagesName: imageNames[company.rawValue], title: title[company.rawValue], rotation: rotations[i], location: locations[i])
            rideList.append(ride)
        }
        completion(rideList)
    }
    
    func getSelectedRide(company: RideCompany, completion: (RideEntity) -> Void) {
        let startIndex = company.rawValue * 3
        let ride = RideEntity(id: startIndex, markerImagesName: imageNames[company.rawValue], title: title[company.rawValue], rotation: rotations[startIndex], location: locations[startIndex])
        completion(ride)
    }
}
