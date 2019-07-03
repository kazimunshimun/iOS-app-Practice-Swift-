//
//  MessageData.swift
//  SocialMeetUp
//
//  Created by Anik on 25/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class MessageData {
    static let shared = MessageData()
    
    let timeAgo: [String] = ["9 hrs ago", "9 hrs ago", "21 hrs ago", "23 hrs ago", "Yesterday", "Yesterday", "2 days ago", "2 days ago", "3 days ago", "4 days ago", "5 days ago", "5 days ago", "6 days ago", "9 days ago"]
    
    let titles: [String] = ["Welcome to Yoga Meetup", "Hi everyone!", "Check out this Meetup with Montreal", "Welcome to out Kizomba meetup", "Hi Stephane", "Bonjour", "Hi everyone!", "Ola", "Bonjour", "Welcome", "Stephane check this", "Check out this", "Hello", "Hi everyone!"]
    
    
    
    func getMessages(completion: ([Message]) -> Void) {
        var messages: [Message] = []
        let senders: [People] = PeopleData.shared.getPeople()
        for i in 0..<titles.count {
            let title = titles[i]
            var isRead = false
            if i > 2 {
                isRead = true
            }
            let message = Message(id: "00\(i)", people: senders[i], title: title, sentTimeAgo: timeAgo[i], isRead: isRead)
            if !isRead {
                message.unreadMessageCount = Int(arc4random()) % 19
            }
            messages.append(message)
            
        }
        completion(messages)
    }
    
}
