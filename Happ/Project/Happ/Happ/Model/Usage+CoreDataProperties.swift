//
//  Usage+CoreDataProperties.swift
//  Happ
//
//  Created by Anik on 21/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//

import Foundation
import CoreData


extension Usage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usage> {
        return NSFetchRequest<Usage>(entityName: "Usage")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var unit: Int16
    @NSManaged public var color: String?
    @NSManaged public var bill: Float
    @NSManaged public var date: NSDate?
    @NSManaged public var appliance: Appliance?

}
