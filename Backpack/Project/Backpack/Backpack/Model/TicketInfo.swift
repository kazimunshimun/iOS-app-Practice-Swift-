//
//  TicketInfo.swift
//  Backpack
//
//  Created by Anik on 23/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct TicketInfo {
    var airlineName: String?
    var ticketClass: String?
    var ticketFrom: String?
    var ticketTo: String?
    var ticketCost: String?
    var departureDate: String?
    var returnDate: String?
    var flightLength: String?
    var travelDate: String?
    
    init(airlineName: String? = nil, ticketClass: String? = nil, ticketFrom: String? = nil, ticketTo: String? = nil,
         ticketCost: String? = nil, departureDate: String? = nil,
         returnDate: String? = nil,
         flightLength: String? = nil,
         travelDate: String? = nil) {
        self.airlineName = airlineName
        self.ticketClass = ticketClass
        self.ticketFrom = ticketFrom
        self.ticketTo = ticketTo
        self.ticketCost = ticketCost
        self.departureDate = departureDate
        self.returnDate = returnDate
        self.flightLength = flightLength
        self.travelDate = travelDate
    }
}
