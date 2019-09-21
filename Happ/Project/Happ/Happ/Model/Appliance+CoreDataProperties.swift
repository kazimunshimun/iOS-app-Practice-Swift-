//
//  Appliance+CoreDataProperties.swift
//  Happ
//
//  Created by Anik on 21/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//

import Foundation
import CoreData


extension Appliance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Appliance> {
        return NSFetchRequest<Appliance>(entityName: "Appliance")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var imageName: String?
    @NSManaged public var type: String?
    @NSManaged public var voltage: Int16
    @NSManaged public var isVisible: Bool
    @NSManaged public var room: String?
    @NSManaged public var settings: Settings?

}
