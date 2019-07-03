//
//  MenuData.swift
//  SocialMeetUp
//
//  Created by Anik on 16/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

final internal class MenuData {
    
    let menuNames = ["YOU", "TRENDING", "HEALTH", "MUSIC", "SPORTS", "LEARNING"]
    let menuImageNames = ["profile_ava", "trending_menu", "health_menu", "music_menu", "sports_menu", "learning_menu"]
    let menuSelectedColors: [UIColor] = [ColorUtils.hexStringToUIColor(hex: "#241332"), ColorUtils.hexStringToUIColor(hex: "#D47FA6"), ColorUtils.hexStringToUIColor(hex: "#B4C55B"), ColorUtils.hexStringToUIColor(hex: "#4EBDEF"), ColorUtils.hexStringToUIColor(hex: "#132641"), ColorUtils.hexStringToUIColor(hex: "#4666E5")]
    
    static let shared = MenuData()
    
    func getMenus(completion: ([Menu]) -> Void) {
        var menus: [Menu] = []
        
        for i in 0..<menuNames.count {
            let menu = Menu(id: "\(i)", image: menuImageNames[i], name: menuNames[i], isSelected: false, menuSelectedColor: menuSelectedColors[i])
            menus.append(menu)
        }
        completion(menus)
    }
}
