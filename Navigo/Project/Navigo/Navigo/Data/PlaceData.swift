//
//  PlaceData.swift
//  Navigo
//
//  Created by Anik on 19/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import CoreLocation

final internal class PlaceData {

    let names = ["Sushi Place", "Nom Nom", "Palace",
    "Pho Montreal", "Rigolati", "Dae Jang Geum",
    "Time Out", "Tree House", "Cozy Sizzler"]
    let imageNames = ["sushi_place_1", "sushi_place_2", "sushi_place_3",
    "soup_place_1", "soup_place_2", "soup_place_3",
    "burger_place_1", "burger_place_2", "burger_place_3"]
    let distances: [Float] = [2.2, 1.2, 4.2, 3.9, 1.7, 2.5, 1.3, 4.3, 3.4]
    let ratings: [Float] = [4.2, 4.5, 4.7, 3.9, 4.8, 4.5, 4.3, 4.3, 4.4]
    let locations: [CLLocation] = [CLLocation(latitude: 51.4976549, longitude: -0.2117534),
                                   CLLocation(latitude: 51.4970644, longitude: -0.2126093),
                                   CLLocation(latitude: 51.4962299, longitude: -0.2106902),
                                   CLLocation(latitude: 51.4958147, longitude: -0.2086598),
                                   CLLocation(latitude: 51.4971387, longitude: -0.2130881),
                                   CLLocation(latitude: 51.4960969, longitude: -0.2087144),
                                   CLLocation(latitude: 51.4979636, longitude: -0.2074568),
                                   CLLocation(latitude: 51.4948706, longitude: -0.211411),
                                   CLLocation(latitude: 51.494379, longitude: -0.2103103)]
    
    static let shared = PlaceData()
    
    func getPlaces(completion: ([PlacesEntity]) -> Void) {
        var placeList: [PlacesEntity] = []
        
        for i in 0..<names.count {
            let place = PlacesEntity(categoryID: i, placeID: 1, name: names[i], imageName: imageNames[i], distance: distances[i], rating: ratings[i], isShowing: false, location: locations[i])
            placeList.append(place)
        }
        completion(placeList)
    }
}
