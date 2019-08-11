//
//  RideEntity.swift
//  Navigo
//
//  Created by Anik on 11/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import CoreLocation

struct RideEntity {
    let id: Int
    let markerImagesName: String
    let title: String
    let rotation: CLLocationDegrees
    let location: CLLocationCoordinate2D
}
