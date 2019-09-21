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
    @NSManaged public var hueSettings: NSSet?

}

// MARK: Generated accessors for hueSettings
extension Settings {

    @objc(addHueSettingsObject:)
    @NSManaged public func addToHueSettings(_ value: Hue)

    @objc(removeHueSettingsObject:)
    @NSManaged public func removeFromHueSettings(_ value: Hue)

    @objc(addHueSettings:)
    @NSManaged public func addToHueSettings(_ values: NSSet)

    @objc(removeHueSettings:)
    @NSManaged public func removeFromHueSettings(_ values: NSSet)

}
