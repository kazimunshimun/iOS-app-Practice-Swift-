//
//  WishlistRequest.swift
//  Plexus
//
//  Created by Anik on 30/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct WishlistRequest: Codable {
    let courseId: Int?
    let category: String?
    let title: String?
    let description: String?
    let imageName: String?
    let rating: Int?
    
    private enum CodingKeys: String, CodingKey {
        case courseId = "id"
        case category = "category"
        case title = "title"
        case description = "description"
        case imageName = "image_name"
        case rating = "rating"
    }
    
}
