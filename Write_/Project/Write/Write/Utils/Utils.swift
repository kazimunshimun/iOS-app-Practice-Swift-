//
//  Utils.swift
//  Write
//
//  Created by Anik on 6/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

public class Utils {
    
    static func getPageCount(forContent content: NSAttributedString) -> Int {
        var lineCount = 0
        content.string.enumerateLines { (str, _) in
            lineCount += 1
        }
        return ((lineCount - 2) / 25) + 1
    }
}
