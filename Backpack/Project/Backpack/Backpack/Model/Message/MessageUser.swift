//
//  MessageUser.swift
//  Backpack
//
//  Created by Anik on 8/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation


struct MessageUser: SenderType, Equatable {
    var senderId: String
    var displayName: String
    var imageName: String
}
