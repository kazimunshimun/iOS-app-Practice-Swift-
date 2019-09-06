//
//  GenericDataSource.swift
//  Write
//
//  Created by Anik on 6/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
