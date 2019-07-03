//
//  GenericDataSource.swift
//  SocialMeetUp
//
//  Created by Anik on 3/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
