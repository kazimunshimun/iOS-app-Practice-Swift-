//
//  MenuData.swift
//  SocialMeetUp
//
//  Created by Anik on 16/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class MenuData {
    
    let menuNames = ["YOU", "TRENDING", "HEALTH", "MUSIC", "SPORTS", "LEARNING"]
    let menuImageNames = ["profile_ava", "trending_menu", "health_menu", "music_menu", "sports_menu", "learning_menu"]
    
    static let shared = MenuData()
    
    func getMenus(completion: ([Menu]) -> Void) {
        var menus: [Menu] = []
        
        for i in 0..<menuNames.count {
            let menu = Menu(id: "\(i)", image: menuImageNames[i], name: menuNames[i], isSelected: false)
            menus.append(menu)
        }
        completion(menus)
    }
}
