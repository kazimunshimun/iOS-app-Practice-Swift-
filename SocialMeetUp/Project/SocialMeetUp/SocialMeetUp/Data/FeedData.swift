//
//  FeedData.swift
//  SocialMeetUp
//
//  Created by Anik on 21/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import MapKit

enum FeedType: String {
    case TRENDING
    case HEALTH
    case MUSIC
    case SPORTS
    case LEARNING
}

final internal class FeedData {
    static let shared = FeedData()
    
    let timeDates:[TimeDate] = [TimeDate(dayOfWeek: "MONDAY", fromTime: "5:00 PM", toTime: "8:00 PM", isToday: false),
                               TimeDate(dayOfWeek: "TUESDAY", fromTime: "5:30 PM", toTime: "7:00 PM", isToday: true),
                               TimeDate(dayOfWeek: "FRIDAY", fromTime: "5:45 PM", toTime: "7:00 PM", isToday: false),
                               TimeDate(dayOfWeek: "MONDAY", fromTime: "6:00 PM", toTime: "7:10 PM", isToday: true),
                               TimeDate(dayOfWeek: "TUESDAY", fromTime: "5:20 PM", toTime: "6:40 PM", isToday: false),
                               TimeDate(dayOfWeek: "SUNDAY", fromTime: "6:30 PM", toTime: "9:00 PM", isToday: false),
                               TimeDate(dayOfWeek: "SATURDAY", fromTime: "7:00 PM", toTime: "10:00 PM", isToday: true),
                               TimeDate(dayOfWeek: "FRIDAY", fromTime: "5:45 PM", toTime: "7:00 PM", isToday: false),
                               TimeDate(dayOfWeek: "MONDAY", fromTime: "6:00 PM", toTime: "7:10 PM", isToday: true),
                               TimeDate(dayOfWeek: "TUESDAY", fromTime: "5:30 PM", toTime: "7:00 PM", isToday: true),
                               TimeDate(dayOfWeek: "MONDAY", fromTime: "6:00 PM", toTime: "7:10 PM", isToday: true),
                               TimeDate(dayOfWeek: "TUESDAY", fromTime: "5:30 PM", toTime: "7:00 PM", isToday: true),
                               TimeDate(dayOfWeek: "MONDAY", fromTime: "6:00 PM", toTime: "7:10 PM", isToday: true),
                               TimeDate(dayOfWeek: "TUESDAY", fromTime: "5:30 PM", toTime: "7:00 PM", isToday: true)]
    
    let titles: [String] = ["Practice French, English And Chinese", "Adobe XD Live Event in Europe", "Yoga and Meditaion for Beginners",
                            "Vegetarians Recipes Meetup", "Top Natural Remedies", "Learn How To do Your Own Juice", "Sports Lover Training Session",
                            "NYC Electronic Music Meetup", "Read Inspiring Quotes Out Loud", "Crazy Effects Music Has on Your Brain",
                            "NBA Drafts Inside", "Football Watch Party",
                            "Machine Learning", "Learning about life untethered from electronics"]
    let descriptions: [String] = ["Want to learn a new language? Get to learn new languages by joining our group.", "UI/UX is next big thing. Want to leant UI creation with Adobe XD? Join our envent in Europe and learn tricks and tips of whats new in Adobe XD.", "New to Yoga, or looking to take your mat to practice in new places? Get to know your local community and neighbours better by joining our Yoga family.",
                                  "Vegetarians Recipe learning courses", "Natural remedies courses", "Juice making meetup", "Sports health nutrition meetup",
                                  "Electronic music meetup", "Inspiring quotes reading meetup", "Effect of music on your brain",
                                  "Get to know about inside out of NBA draft of this year. Join us", "Watch party with football enthusiastics around you.",
                                  "Want to learn about how machine learning going to change the future. Join us on this elavorate session on machine learning and more", "Learn about life untethered from electronics."]
    
    
    let locations: [Location] = [
                                Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749)),
                                 Location(name: "The Bay Department Store  (7 th Floor restaurant/cafeteria dining hall)", address: "585 Saint Catherine Street West, Montreal, QC", latitudeLogitude: CLLocation(latitude: 45.5303, longitude: -73.749))]
    
    let costs: [String] = ["$ 21.00", "$ 12.00", "$ 19.00", "$ 25.00", "$ 14.00", "$ 19.99", "$ 49.99", "$ 9.99", "$ 19.99", "$ 30.00", "$ 9.99", "$ 3.00", "$ 19.00", "$ 25.00"]
    let totalSpots: [Int] = [60, 50, 20, 15, 30, 35, 45, 40, 10, 15, 20, 10, 20, 30, 35]
    
    let groups: [Group] = [Group(id: "0001", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0002", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0003", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0004", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0005", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0006", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0007", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0008", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0009", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0010", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0011", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0010", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0011", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0010", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true),
                           Group(id: "0011", name: "Easy And Gentle Yoga", address: "Montreal, QC", groupImage: "yoga_icon", isPublic: true)]
    let joinedPeoples: [People] = []
    
    let feedTypes: [FeedType] = [.TRENDING, .TRENDING, .TRENDING,
                                .HEALTH, .HEALTH, .HEALTH, .HEALTH,
                                .MUSIC, .MUSIC, .MUSIC, .SPORTS, .SPORTS, .LEARNING, .LEARNING]
    
    let feedColors: [UIColor] = [ColorUtils.hexStringToUIColor(hex: "#D47FA6"),
                                 ColorUtils.hexStringToUIColor(hex: "#8A56AC"),
                                 ColorUtils.hexStringToUIColor(hex: "#241332"),
                                 ColorUtils.hexStringToUIColor(hex: "#B4C55B"),
                                 ColorUtils.hexStringToUIColor(hex: "#417623"),
                                 ColorUtils.hexStringToUIColor(hex: "#52912E"),
                                 ColorUtils.hexStringToUIColor(hex: "#253E12"),
                                 ColorUtils.hexStringToUIColor(hex: "#4EBDEF"),
                                 ColorUtils.hexStringToUIColor(hex: "#4666E5"),
                                 ColorUtils.hexStringToUIColor(hex: "#132641"),
                                 ColorUtils.hexStringToUIColor(hex: "#132641"),
                                 ColorUtils.hexStringToUIColor(hex: "#000080"),
                                 ColorUtils.hexStringToUIColor(hex: "#4666E5"),
                                 ColorUtils.hexStringToUIColor(hex: "#6CA0DC")]
    
    let feedIcons: [String] = ["world_icon", "xd_icon", "beat_icon",
                            "health_icon", "thermometer", "beat_icon", "beat_icon",
                            "music_icon", "book_icon", "music_icon",
                            "setup_icon", "world_icon",
                            "book_icon", "beat_icon"]
    
    func getFeeds(type: FeedType,completion: ([Feed]) -> Void) {
        var feeds: [Feed] = []
        let hostedBy: [People] = PeopleData.shared.getPeople()
        
        for i in 0..<titles.count {
            let feedType = feedTypes[i]
            if feedType == type {
                let title = titles[i]
                let description = descriptions[i]
                let timeDate = timeDates[i]
                let location = locations[i]
                
                let cost = costs[i]
                let totalSpot = totalSpots[i]
                
                let color = feedColors[i]
                
                let randomJoinedPeople = Int(Int(arc4random()) % Int(totalSpot) % hostedBy.count)
                let joinedPeople = hostedBy[randomPick: randomJoinedPeople]
                
                //let isGoing = randomJoinedPeople % 2 == 0
                let isGoing = false
                
                let feed = Feed(id: "\(i)", title: title, desccription: description, timeDate: timeDate, location: location, hostedBy: hostedBy[i], cost: cost, totalSpot: totalSpot, group: groups[i], joinedPeople: joinedPeople, isGoing: isGoing, feedType: feedType, feedColor: color, feedIcon: feedIcons[i])
                feeds.append(feed)
            }
            
        }
        completion(feeds)
    }
}

extension Array {
    /// Picks `n` random elements (partial Fisher-Yates shuffle approach)
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}
