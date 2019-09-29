//
//  Constants.swift
//  Happ
//
//  Created by Anik on 29/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

public class Constants {
    static let daysArray:[WeekUsage] = [WeekUsage(name: "Daily", isSelected: true),
                                        WeekUsage(name: "Monday", isSelected: true),
                                        WeekUsage(name: "Tuesday", isSelected: true),
                                        WeekUsage(name: "Wednesday", isSelected: true),
                                        WeekUsage(name: "Thrusday", isSelected: true),
                                        WeekUsage(name: "Friday", isSelected: true),
                                        WeekUsage(name: "Saturday", isSelected: true),
                                        WeekUsage(name: "Sunday", isSelected: true)]
}

struct WeekUsage {
    let name: String
    let isSelected: Bool
}
