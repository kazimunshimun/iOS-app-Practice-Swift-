//
//  Settings+CoreDataProperties.swift
//  Happ
//
//  Created by Anik on 21/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//

import Foundation
import CoreData


extension Settings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Settings> {
        return NSFetchRequest<Settings>(entityName: "Settings")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var temparature: Float
    @NSManaged public var isOn: Bool
    @NSManaged public var isPowerSaverOn: Bool
    @NSManaged public var hueSettins: NSSet?

}

// MARK: Generated accessors for hueSettins
extension Settings {

    @objc(addHueSettinsObject:)
    @NSManaged public func addToHueSettins(_ value: Hue)

    @objc(removeHueSettinsObject:)
    @NSManaged public func removeFromHueSettins(_ value: Hue)

    @objc(addHueSettins:)
    @NSManaged public func addToHueSettins(_ values: NSSet)

    @objc(removeHueSettins:)
    @NSManaged public func removeFromHueSettins(_ values: NSSet)

}
