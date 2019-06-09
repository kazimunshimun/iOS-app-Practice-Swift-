//
//  MessageType.swift
//  Backpack
//
//  Created by Anik on 8/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

public protocol MessageType {
    
    /// The sender of the message.
    var sender: SenderType { get }
    
    /// The unique identifier for the message.
    var messageId: String { get }
    
    /// The date the message was sent.
    var sentDate: Date { get }
    
    /// The kind of message and its underlying kind.
    var kind: MessageKind { get }
    
}
