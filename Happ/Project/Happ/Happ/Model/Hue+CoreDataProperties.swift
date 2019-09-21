//
//  Hue+CoreDataProperties.swift
//  Happ
//
//  Created by Anik on 21/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//

import Foundation
import CoreData


extension Hue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hue> {
        return NSFetchRequest<Hue>(entityName: "Hue")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var color: String?
    @NSManaged public var brightness: Float

}
