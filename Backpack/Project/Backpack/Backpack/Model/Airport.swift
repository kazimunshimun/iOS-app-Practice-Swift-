//
//  Airport.swift
//  Backpack
//
//  Created by Anik on 27/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation


struct Airport {
    let name: String
    let shortForm: String
    let city: String
    
    init(name: String, short: String, city: String) {
        self.name = name
        self.shortForm = short
        self.city = city
    }
}
