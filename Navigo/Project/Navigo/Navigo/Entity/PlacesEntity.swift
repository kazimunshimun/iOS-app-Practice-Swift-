//
//  Places.swift
//  Navigo
//
//  Created by Anik on 13/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import CoreLocation

struct PlacesEntity {
    let categoryID: Int
    let placeID: Int
    let name: String
    let imageName: String
    let distance: Float
    let rating: Float
    var isShowing: Bool = false
    let location: CLLocation
}
