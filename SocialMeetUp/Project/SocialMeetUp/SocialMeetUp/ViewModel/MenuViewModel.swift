//
//  MenuViewModel.swift
//  SocialMeetUp
//
//  Created by Anik on 4/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation


struct MenuViewModel {
    
    weak var dataSource : GenericDataSource<Menu>?
    
    init(dataSource : GenericDataSource<Menu>?) {
        self.dataSource = dataSource
    }
    
    func fetchMenus() {
        MenuData.shared.getMenus() { menus in
            DispatchQueue.main.async {
                self.dataSource?.data.value = menus
            }
        }
    }
}
