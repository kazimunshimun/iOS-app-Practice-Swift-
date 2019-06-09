//
//  MessageKind.swift
//  Backpack
//
//  Created by Anik on 8/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

public enum MessageKind {
    case text(String)
    
    /// A message with attributed text.
    case attributedText(NSAttributedString)
}
