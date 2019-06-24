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
    let totalSpot: Int
    let group: Group
    let joinedPeople: [People]
    let isGoing: Bool
    
    let feedType: FeedType
    let feedColor: UIColor
    
    let feedIcon: String
}
