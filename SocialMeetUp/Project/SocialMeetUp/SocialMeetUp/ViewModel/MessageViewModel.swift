//
//  MessageViewModel.swift
//  SocialMeetUp
//
//  Created by Anik on 3/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct MessageViewModel {
    
    weak var dataSource : GenericDataSource<Message>?
    
    init(dataSource : GenericDataSource<Message>?) {
        self.dataSource = dataSource
    }
    
    func fetchMessages() {
        MessageData.shared.getMessages() { messages in
            DispatchQueue.main.async {
                self.dataSource?.data.value = messages
            }
        }
    }
}
