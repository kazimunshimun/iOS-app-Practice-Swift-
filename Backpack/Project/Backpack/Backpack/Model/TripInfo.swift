//
//  TripInfo.swift
//  Backpack
//
//  Created by Anik on 23/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct TripInfo {
    let from: String
    let to: String
    let visibility: String?
    let tripFor: String?
    
    init(from: String, to: String, visibility: String? = nil,
         tripFor: String? = nil) {
        self.from = from
        self.to = to
        self.visibility = visibility
        self.tripFor = tripFor
    }
}
