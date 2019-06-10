//
//  MessageData.swift
//  Backpack
//
//  Created by Anik on 8/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class MessageData {
    static let shared = MessageData()
    
    private let formatter = DateFormatter()
    
    private init() {
        formatter.dateFormat = "MMM d, yyyy, h:mm a"
    }
    
    enum MessageTypes: String, CaseIterable {
        case Text
        case AttributedText
    }

    let jennifer = MessageUser(senderId: "000000", displayName: "Jennifer", imageName: "jennifer_pp")
    let lisa = MessageUser(senderId: "000001", displayName: "Lisa", imageName: "lisa_pp")
    let sandra = MessageUser(senderId: "000002", displayName: "Sandra", imageName: "sandra_pp")
    let wu = MessageUser(senderId: "000003", displayName: "Wu Zhong", imageName: "sandra_pp")
    
    lazy var senders = [jennifer, lisa, sandra]
    
    var currentSender: MessageUser {
        return wu
    }
    
    var now = Date()
    
    func dateAddingRandomTime() -> Date {
        let randomNumber = Int(arc4random_uniform(UInt32(10)))
        if randomNumber % 2 == 0 {
            let date = Calendar.current.date(byAdding: .hour, value: randomNumber, to: now)!
            now = date
            return date
        } else {
            let randomMinute = Int(arc4random_uniform(UInt32(59)))
            let date = Calendar.current.date(byAdding: .minute, value: randomMinute, to: now)!
            now = date
            return date
        }
    }
    
    func randomMessageType() -> MessageTypes {
        var messageTypes = [MessageTypes]()
        for type in MessageTypes.allCases {
            if UserDefaults.standard.bool(forKey: "\(type.rawValue)" + " Messages") {
                messageTypes.append(type)
            }
        }
        return messageTypes.random()!
    }
    
    func getMessages(count: Int, completion: ([Message]) -> Void) {
        var messages: [Message] = []
        // Disable Custom Messages
        //UserDefaults.standard.set(false, forKey: "Custom Messages")
        for _ in 0..<count {
            let uniqueID = UUID().uuidString
            let user = senders.random()!
            let date = dateAddingRandomTime()
            let dateString = formatter.string(from: date)
            let randomSentence = Lorem.sentence()
            let message = Message(text: randomSentence, user: user, messageId: uniqueID, date: dateString)
            messages.append(message)
        }
        completion(messages)
    }
}
