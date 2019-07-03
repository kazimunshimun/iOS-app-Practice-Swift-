//
//  NotificationViewModel.swift
//  SocialMeetUp
//
//  Created by Anik on 3/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct NotificationViewModel {
    
    weak var dataSource : GenericDataSource<Notifiation>?
    
    init(dataSource : GenericDataSource<Notifiation>?) {
        self.dataSource = dataSource
    }
    
    func fetchNotifiations() {
        NotificationData.shared.getNotifications() { notifi in
            DispatchQueue.main.async {
                self.dataSource?.data.value = notifi
            }
        }
    }
}
