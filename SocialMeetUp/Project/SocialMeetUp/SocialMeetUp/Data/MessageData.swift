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
    
    let senders: [People] = [People(id: "001", name: "Dina Meyer", imageName: "joe"),
                             People(id: "002", name: "Stephane Moreau", imageName: "paul"),
                             People(id: "003", name: "Andi Lane", imageName: "carl"),
                             People(id: "004", name: "Anson Buck", imageName: "john"),
                             People(id: "005", name: "Marie Ann", imageName: "marie"),
                             People(id: "006", name: "Elon Mask", imageName: "elon"),
                             People(id: "007", name: "Blake Marie", imageName: "blake"),
                             People(id: "008", name: "Dale Aldrin", imageName: "dale"),
                             People(id: "009", name: "Kat Hope", imageName: "kat"),
                             People(id: "010", name: "Mark Gomez", imageName: "mark"),
                             People(id: "011", name: "Mila Curry", imageName: "mila"),
                             People(id: "012", name: "Adam Thomas", imageName: "adam"),
                             People(id: "013", name: "Ema Poter", imageName: "profile_ava"),
                             People(id: "014", name: "Oliva Johnson", imageName: "oliva")]
    
    let timeAgo: [String] = ["9 hrs ago", "9 hrs ago", "21 hrs ago", "23 hrs ago", "Yesterday", "Yesterday", "2 days ago", "2 days ago", "3 days ago", "4 days ago", "5 days ago", "5 days ago", "6 days ago", "9 days ago"]
    
    let titles: [String] = ["Welcome to Yoga Meetup", "Hi everyone!", "Check out this Meetup with Montreal", "Welcome to out Kizomba meetup", "Hi Stephane", "Bonjour", "Hi everyone!", "Ola", "Bonjour", "Welcome", "Stephane check this", "Check out this", "Hello", "Hi everyone!"]
    
    
    
    func getMessages(completion: ([Message]) -> Void) {
        var messages: [Message] = []
        
        for i in 0..<titles.count {
            let title = titles[i]
            var isRead = false
            if i > 2 {
                isRead = true
            }
            let message = Message(id: "00\(i)", people: senders[i], title: title, sentTimeAgo: timeAgo[i], isRead: isRead)
            if !isRead {
                message.unreadMessageCount = (11 + i) % 5
            }
            messages.append(message)
            
        }
        completion(messages)
    }
    
}
