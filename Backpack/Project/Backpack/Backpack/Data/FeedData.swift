//
//  FeedData.swift
//  Backpack
//
//  Created by Anik on 3/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class FeedData {
    static let shared = FeedData()
    
    init() {
        
    }
    
    let jennifer = People(name: "Jennifer", imageName: "jennifer_pp", isFollwed: true)
    let lisa = People(name: "Lisa", imageName: "lisa_pp", isFollwed: true)
    let sandra = People(name: "Sandra", imageName: "sandra_pp", isFollwed: true)
    
    lazy var peoples = [jennifer, lisa, sandra]
    
    let postedTimes = ["2 hours ago", "5 hours ago", "6 hours ago"]
    
    let tripDurations = [7, 12, 9]
    
    let tripLocations = ["Bali", "Finland", "Japan"]
    
    let currentStatus = ["ON TRIP", "IN 2 DAYS", "ON TRIP"]
    
    let descriptions = ["", "", ""]
    
    let isLoved = [true, false, true]
    
    let isShared = [false, false, true]
    
    let tripImageNames = ["trip_3", "trip_4", "trip_2"]

    func getFeeds(completion: ([Trip]) -> Void) {
        var feeds: [Trip] = []
        
        for i in 0..<peoples.count {
            let feed = Trip(people: peoples[i], postedTime: postedTimes[i], tripDuration: tripDurations[i], tripLocation: tripLocations[i], currentStatus: currentStatus[i], description: descriptions[i], isLoved: isLoved[i], isShared: isShared[i], tripImage: tripImageNames[i])
            feeds.append(feed)
        }
        completion(feeds)
    }
}
