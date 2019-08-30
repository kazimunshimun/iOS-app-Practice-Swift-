//
//  ProfileRequest.swift
//  Plexus
//
//  Created by Anik on 30/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct ProfileRequest: Codable {
    
    let profileId: Int?
    let name: String?
    let detail: String?
    let profileImage: String?
    let completedCourses: [CopmpletedCourse]?
    let topRated: [Course]?
    
    private enum CodingKeys: String, CodingKey {
        case profileId = "id"
        case name = "name"
        case detail = "detail"
        case profileImage = "profileImage"
        case completedCourses = "completed"
        case topRated = "topRated"
    }
    
}

struct CopmpletedCourse: Codable {
    let courseId: Int?
    let imageName: String?
    
    private enum CodingKeys: String, CodingKey {
        case courseId = "id"
        case imageName = "image_name"
    }
}
