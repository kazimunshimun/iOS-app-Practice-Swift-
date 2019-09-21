//
//  DataManager.swift
//  Happ
//
//  Created by Anik on 21/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
    func fetchAppliances() throws -> [Appliance] {
        let appliances = try self.context.fetch(Appliance.fetchRequest() as NSFetchRequest<Appliance>)
        return appliances
    }
    
    func insertAppliance(appliance: Appliance) throws {
        self.context.insert(appliance)
        try self.context.save()
    }
    
    func updateAppliance(appliance: Appliance) throws {
        try self.context.save()
    }
    
    func fetchUsages() throws -> [Usage] {
        let appliances = try self.context.fetch(Usage.fetchRequest() as NSFetchRequest<Usage>)
        return appliances
    }
    
    func insertUsage(usage: Usage) throws {
        self.context.insert(usage)
        try self.context.save()
    }
    
    func updateUsage(usage: Usage) throws {
        try self.context.save()
    }
    
    func fetchLightTimer() throws -> [LightTimer] {
        let appliances = try self.context.fetch(LightTimer.fetchRequest() as NSFetchRequest<LightTimer>)
        return appliances
    }
    
    func insertLightTimer(timer: LightTimer) throws {
        self.context.insert(timer)
        try self.context.save()
    }
    
    func updateLightTimer(timer: LightTimer) throws {
        try self.context.save()
    }
}
