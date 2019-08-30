//
//  OnlineRequest.swift
//  Plexus
//
//  Created by Anik on 30/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct OnlineRequest: Codable {
    let courseId: Int?
    let title: String?
    let imageName: String?
    
    private enum CodingKeys: String, CodingKey {
        case courseId = "id"
        case title = "title"
        case imageName = "image_name"
    }
    
}
