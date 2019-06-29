//
//  ChatData.swift
//  SocialMeetUp
//
//  Created by Anik on 29/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class ChatData {
    static let shared = ChatData()
    
    let titles: [String] = ["Hello", "what is the best time to visit Rio de Janeiro?", "March is one of the best months to visit Rio. You can enjoy the beach and many of the attractions. ", "And what about Carnival time?", "Oh sure, late February or first days of March, a reason why accommodation fetches its highest  prices. ", "but is it safe?", "Of course it’s safe to visit, but visitors just have to have street smarts and their wits about them more so than in almost any other major city in the world. ", "Hi everyone!", "Thank you very much", "you got it!", "Talk to you later.", "Good bye"]
    
    var currentSender: People {
        return People(id: "013", name: "Ema Poter", imageName: "profile_ava")
    }
    
    func getChats(count: Int, senderName: String, completion: ([Chat]) -> Void) {
        var chats: [Chat] = []
        let senders: [People] = PeopleData.shared.getPeople()
        
        let isContainSender = senders.contains{ $0.name == senderName }
        
        var sendersOnlyTwo: [People]
        
        if isContainSender {
            let senderProfile = senders.first {$0.name == senderName}
            sendersOnlyTwo = [senderProfile, currentSender] as! [People]
        } else {
            sendersOnlyTwo = [senders.first as Any, currentSender] as! [People]
        }
        
        for i in 0..<titles.count {
            let title = titles[i]
            let user = sendersOnlyTwo.random()!
            let isIncoming = user.name == senderName
            let chat = Chat(id: "00\(i)", profile: user, text: title, isIncoming: isIncoming)
            chats.append(chat)
        }
        completion(chats)
    }
}

public extension Array {
    func shuffled() -> [Element] {
        var list = self
        list.shuffle()
        return list
    }
    
    func random() -> Element? {
        return (count > 0) ? self.shuffled()[0] : nil
    }
}
