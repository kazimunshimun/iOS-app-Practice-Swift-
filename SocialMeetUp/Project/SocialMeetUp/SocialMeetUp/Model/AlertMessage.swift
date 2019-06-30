//
//  AlertMessage.swift
//  SocialMeetUp
//
//  Created by Anik on 30/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct AlertMessage {
    let title: String?
    let description: String?
    let groupImage: String?
    let message: String?
    
    init(title: String, description: String? = nil, groupImage: String? = nil, message: String? = nil) {
        self.title = title
        self.description = description
        self.groupImage = groupImage
        self.message = message
    }
    
}
