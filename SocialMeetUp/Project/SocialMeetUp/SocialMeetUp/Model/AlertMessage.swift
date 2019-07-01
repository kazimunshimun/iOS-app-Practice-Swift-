//
//  AlertMessage.swift
//  SocialMeetUp
//
//  Created by Anik on 30/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

struct AlertMessage {
    let title: String?
    let description: String?
    let groupImageName: String?
    let message: String?
    let groupImage: UIImage?
    
    init(title: String, description: String? = nil, groupImageName: String? = nil, message: String? = nil, groupImage: UIImage? = nil) {
        self.title = title
        self.description = description
        self.groupImageName = groupImageName
        self.message = message
        self.groupImage = groupImage
    }
    
}
