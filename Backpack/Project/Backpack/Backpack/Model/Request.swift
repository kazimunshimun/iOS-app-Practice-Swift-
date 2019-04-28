//
//  Request.swift
//  Backpack
//
//  Created by Anik on 28/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct Request {
    let userImageName: String?
    let length: Int?
    let startDate: String?
    let fromLocation: String?
    let toLocation: String?
    let lastMessage: String?
    let lastMessageSender: String?
    let status: String?
    let tripImageName: String?
    
    init(userImageName: String? = nil, length: Int? = nil, startDate: String? = nil, fromLocation: String? = nil, toLocation: String? = nil, lastMessage: String? = nil, lastMessageSender: String? = nil, status: String? = nil, tripImageName: String? = nil) {
        self.userImageName = userImageName
        self.length = length
        self.startDate = startDate
        self.fromLocation = fromLocation
        self.toLocation = toLocation
        self.lastMessage = lastMessage
        self.lastMessageSender = lastMessageSender
        self.status = status
        self.tripImageName = tripImageName
    }
}
