//
//  ChatViewModel.swift
//  SocialMeetUp
//
//  Created by Anik on 4/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct ChatViewModel {
    
    weak var dataSource : GenericDataSource<Chat>?
    
    init(dataSource : GenericDataSource<Chat>?) {
        self.dataSource = dataSource
    }
    
    func fetchChats(count: Int, hostedBy: String) {
        ChatData.shared.getChats(count: count, senderName: hostedBy) { messages in
            DispatchQueue.main.async {
                self.dataSource?.data.value = messages
            }
        }
    }
}
