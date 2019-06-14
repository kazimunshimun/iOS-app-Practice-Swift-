//
//  TripData.swift
//  Backpack
//
//  Created by Anik on 3/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class TripData {
    
    let jennifer = People(name: "Jennifer", imageName: "jennifer_pp", isFollwed: true)
    let lisa = People(name: "Lisa", imageName: "lisa_pp", isFollwed: true)
    let sandra = People(name: "Sandra", imageName: "sandra_pp", isFollwed: true)
    
    lazy var peoples = [jennifer, lisa, sandra]
    
    let postedTimes = ["2 hours ago", "5 hours ago", "6 hours ago"]
    
    let tripDurations = [7, 12, 9]
    
    let tripLocations = ["Bali", "Finland", "Japan"]
    
    let descriptions = ["", "", ""]
    
    let tripImageNames = ["bali_1", "addImage_1", "Splash_2"]
    
    let pastTripLocations = ["PRAGUE", "ITALY", "ARGENTINA"]
    
    let pastTripImage = ["prague", "italy", "argentina"]
    
    static let shared = TripData()
    
    private init() {}
    
    func getCurrentTrips(forUser userName: String, completion: ([Trip]) -> Void) {
        var feeds: [Trip] = []
        
        let userProfile = peoples.first {$0.name == userName}!
        
        for i in 0..<tripLocations.count {
            let feed = Trip(people: userProfile, postedTime: postedTimes[i], tripDuration: tripDurations[i], tripLocation: tripLocations[i], currentStatus: "ON TRIP", description: descriptions[i], isLoved: false, isShared: false, tripImage: tripImageNames[i])
            feeds.append(feed)
        }
        completion(feeds)
    }
    
    func getPastTrips(forUser userName: String, completion: ([Trip]) -> Void) {
        var feeds: [Trip] = []
        
        let userProfile = peoples.first {$0.name == userName}!
        
        for i in 0..<pastTripLocations.count {
            let feed = Trip(people: userProfile, postedTime: postedTimes[i], tripDuration: tripDurations[i], tripLocation: pastTripLocations[i], currentStatus: "PAST TRIP", description: descriptions[i], isLoved: false, isShared: false, tripImage: pastTripImage[i])
            feeds.append(feed)
        }
        completion(feeds)
    }
}
