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
    var ticketCost: Int?
    var departureDate: String?
    var returnDate: String?
    var flightLength: String?
    var travelDate: String?
    
    var airportFrom: Airport?
    var airportTo: Airport?

    var ticketCostFrom: Int?
    var ticketCostTo: Int?
    
    var flightLengthReturn: String?
    
    var flightTimeFromStart: String?
    var flightTimeFromEnd: String?
    var flightTimeToStart: String?
    var flightTimeToEnd: String?
    
    var returnDepartureDate: String?
    var returnArrivalDate: String?
    
    init(airlineName: String? = nil, ticketClass: String? = nil, ticketFrom: String? = nil, ticketTo: String? = nil,
         ticketCost: Int? = nil, departureDate: String? = nil,
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
