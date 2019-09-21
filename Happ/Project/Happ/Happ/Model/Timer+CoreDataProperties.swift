//
//  Timer+CoreDataProperties.swift
//  Happ
//
//  Created by Anik on 21/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//

import Foundation
import CoreData


extension Timer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Timer> {
        return NSFetchRequest<Timer>(entityName: "Timer")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var isRepeat: Bool
    @NSManaged public var onTime: String?
    @NSManaged public var offTime: String?
    @NSManaged public var appliance: NSSet?

}

// MARK: Generated accessors for appliance
extension Timer {

    @objc(addApplianceObject:)
    @NSManaged public func addToAppliance(_ value: Appliance)

    @objc(removeApplianceObject:)
    @NSManaged public func removeFromAppliance(_ value: Appliance)

    @objc(addAppliance:)
    @NSManaged public func addToAppliance(_ values: NSSet)

    @objc(removeAppliance:)
    @NSManaged public func removeFromAppliance(_ values: NSSet)

}
