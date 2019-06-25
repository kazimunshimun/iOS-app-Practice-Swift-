//
//  Notification.swift
//  SocialMeetUp
//
//  Created by Anik on 25/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

class Notifiation {
    let id: String
    let sender: People
    let title: String
    let sentTimeAgo: String
    let isRead: Bool
    
    init(id: String, people: People, title: String, sentTimeAgo: String, isRead: Bool) {
        self.id = id
        self.sender = people
        self.title = title
        self.sentTimeAgo = sentTimeAgo
        self.isRead = isRead
    }
}
