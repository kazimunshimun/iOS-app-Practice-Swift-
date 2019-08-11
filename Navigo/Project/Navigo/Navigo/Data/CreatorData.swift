//
//  CreatorData.swift
//  Navigo
//
//  Created by Anik on 10/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class CreatorData {
    static let shared = CreatorData()
    
    let roles = ["CEO", "Team Lead",
                 "UI/UX Engineer", "Software Engineer", "QA Engineer"]
    let names = ["Kat Hope", "Mark Gomez", "Ema Poter",
                 "Adam Thomas", "Oliva Johnson"]
    let imageNames = ["profile_photo", "blake", "driver_icon",
                      "grant", "Avatar"]
    
    func getCreators(completion: ([CreatorEntity]) -> Void) {
        var creatorList: [CreatorEntity] = []
        
        for i in 0..<names.count {
            let creator = CreatorEntity(id: i, imagesName: imageNames[i], name: names[i], role: roles[i])
            creatorList.append(creator)
        }
        completion(creatorList)
    }
}
