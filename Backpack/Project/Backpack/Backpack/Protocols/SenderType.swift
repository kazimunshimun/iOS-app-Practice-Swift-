//
//  SenderType.swift
//  Backpack
//
//  Created by Anik on 8/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

public protocol SenderType {
    
    /// The unique String identifier for the sender.
    ///
    /// Note: This value must be unique across all senders.
    var senderId: String { get }
    
    /// The display name of a sender.
    var displayName: String { get }
}
