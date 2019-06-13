//
//  Message.swift
//  Backpack
//
//  Created by Anik on 7/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import CoreLocation
import AVFoundation

internal struct Message {
    var messageId: String
    var sender: SenderType {
        return user
    }
    var sentDate: String
    var kind: MessageKind
    
    var user: MessageUser
    var isIncoming: Bool
    var isShoulShowSenderImage: Bool = true
    
    private init(kind: MessageKind, user: MessageUser, messageId: String, date: String, isIncoming: Bool) {
        self.kind = kind
        self.user = user
        self.messageId = messageId
        self.sentDate = date
        self.isIncoming = isIncoming
    }
    
    init(text: String, user: MessageUser, messageId: String, date: String, incoming: Bool) {
        self.init(kind: .text(text), user: user, messageId: messageId, date: date, isIncoming: incoming)
    }
    
    init(attributedText: NSAttributedString, user: MessageUser, messageId: String, date: String, incoming: Bool) {
        self.init(kind: .attributedText(attributedText), user: user, messageId: messageId, date: date, isIncoming: incoming)
    }
}
