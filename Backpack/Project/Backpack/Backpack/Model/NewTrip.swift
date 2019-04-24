//
//  NewTrip.swift
//  Backpack
//
//  Created by Anik on 23/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct NewTrip {
    var tripInfo: TripInfo?
    let flightInfo: FlightInfo?
    let ticketInfo: TicketInfo?
    
    init(trip: TripInfo? = nil,
        flight: FlightInfo? = nil,
        ticket: TicketInfo? = nil) {
        
        self.tripInfo = trip
        self.flightInfo = flight
        self.ticketInfo = ticket
    }
}
