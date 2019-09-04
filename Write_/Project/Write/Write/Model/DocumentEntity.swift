//
//  Document.swift
//  Write
//
//  Created by Anik on 28/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct DocumentEntity {
    let id: Int16
    let date: NSDate
    let title: String
    let writer: String
    let content: NSAttributedString
}
