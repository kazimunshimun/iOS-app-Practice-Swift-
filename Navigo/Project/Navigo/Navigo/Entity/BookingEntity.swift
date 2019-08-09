//
//  BookingEntity.swift
//  Navigo
//
//  Created by Anik on 9/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import CoreLocation

enum BookingType: String {
    case meeting
    case dinner
    case lunch
    case brunch
}

struct BookingEntity {
    let id: Int
    let timeDate: String
    let imagesName: [String]
    let name: String
    let type: BookingType
    let location: CLLocation
}
