//
//  NotificationData.swift
//  SocialMeetUp
//
//  Created by Anik on 25/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class NotificationData {
    static let shared = NotificationData()
    
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
    
    let titles: [String] = ["Everyday English-French-Spanish: Conversation and Fun - Joe!", "Assemblea Amici di Beppe Grillo Salerno", "Riunione del gruppo Casavatore in MoVimento - forum M5S", "Napoli the Meaning of Life in Buddhism teachings Meetup", "Elavorate session on machine learning and more", "Football enthusiastics around you", "Everyday English-French-Spanish: Conversation and Fun - Joe!", "Assemblea Amici di Beppe Grillo Salerno", "Riunione del gruppo Casavatore in MoVimento - forum M5S", "Napoli the Meaning of Life in Buddhism teachings Meetup", "Gruppo Casavatore in MoVimento", "Meaning of Life Meetup", "Elavorate session on machine learning and more", "Crypto currencies understanding meetup"]
    
    
    
    func getNotifications(completion: ([Notifiation]) -> Void) {
        
        var notifications: [Notifiation] = []
        
        for i in 0..<titles.count {
            let title = titles[i]
            var isRead = false
            if i > 3 {
                isRead = true
            }
            let notification = Notifiation(id: "00\(i)", people: senders[i], title: title, sentTimeAgo: timeAgo[i], isRead: isRead)
            notifications.append(notification)
            
        }
        completion(notifications)
    }
    
}
