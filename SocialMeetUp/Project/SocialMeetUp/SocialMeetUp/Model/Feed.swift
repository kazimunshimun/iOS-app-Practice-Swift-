//
//  Feed.swift
//  SocialMeetUp
//
//  Created by Anik on 21/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

struct Feed {
    let id: String
    let title: String
    let desccription: String
    let timeDate: TimeDate
    let location: Location
    let hostedBy: People
    let cost: String
    var totalSpot: Int
    let group: Group
    var joinedPeople: [People]
    var isGoing: Bool
    
    let feedType: FeedType
    let feedColor: UIColor
    
    let feedIcon: String
}
