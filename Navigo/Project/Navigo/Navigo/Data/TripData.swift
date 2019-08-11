//
//  TripData.swift
//  Navigo
//
//  Created by Anik on 11/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class TripData {
    static let shared = TripData()
    let dateTime = ["Jul 10 - 12:30PM", "Jul 13 - 2:50PM", "Jul 15 - 5:15PM", "Jul 16 - 7:50PM", "Jul 19 - 8:15PM",
                    "Jul 23 - 2:50PM", "Jul 27 - 5:15PM", "Jul 29 - 7:50PM", "Aug 5 - 8:15PM"]
    let pickupLocation = ["Frash Market", "Ragatoli", "Tree House", "My Home", "Manhatan Market",
                          "My Home", "Tree House", "Ragatoli", "Manhatan Market"]
    let destinationLocation = ["My Home", "My Office", "Gym", "Sushi Place", "My Home",
                               "Gym", "My Office", "Sushi Place", "My Home"]
    
    func getHistoryTrips(completion: ([TripEntity]) -> Void) {
        var tripList: [TripEntity] = []
        for i in 0..<5 {
            let trip = TripEntity(id: i, dateAndTime: dateTime[i], pickupLocationName: pickupLocation[i], destinationLocationName: destinationLocation[i])
            tripList.append(trip)
        }
        completion(tripList)
    }
    
    func getUpcomingTrips(completion: ([TripEntity]) -> Void) {
        var tripList: [TripEntity] = []
        for i in 5..<dateTime.count {
            let trip = TripEntity(id: i, dateAndTime: dateTime[i], pickupLocationName: pickupLocation[i], destinationLocationName: destinationLocation[i])
            tripList.append(trip)
        }
        completion(tripList)
    }
}
