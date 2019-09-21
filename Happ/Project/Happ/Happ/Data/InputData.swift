//
//  InputData.swift
//  Happ
//
//  Created by Anik on 21/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct InputData {
    
    let applianceName = ["Air Conditioner", "Smart Light", "Refrigerator", "Fan", "40 W CFL", "Washing Machine", "All Lights"]
    let imageName = ["air-conditioner", "light-bulb-on", "refrigarator", "fan", "led_light", "washing_machine", "all_light"]
    
    let room = ["Living Room", "Kitchen", "Kitchen", "Living Room", "Bed Room", "Bathroom", "Garden"]
    
    let type = ["ac", "light", "refrigarator", "fan", "light", "washing_machine", "light"]
    
    let voltage: [Int16] = [232, 120, 220, 212, 170, 230, 200]

    let temparature = [23, 10, 13, 27, 20, 18, 22]
    
    let isPowerSaverOn = [true, false, false, true, false, true, true]
    
    let isOn = [true, false, true, true, false, true, true]
    
    let colors = [[], ["F6D200", "FCA400", "F26400", "F31E16", "871B97", "5A2598", "432DA0", "28AF6F", "26A53C", "94CE00"], [], [], [], [], ["871B97", "5A2598", "432DA0"]]
    let brightness = [0, 45, 0, 0, 0, 0, 49]
    
    public func insertApplianceData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let applianceEntity = NSEntityDescription.entity(forEntityName: "Appliance", in: context)
        let settingsEntity = NSEntityDescription.entity(forEntityName: "Settings", in: context)
        let hueEntity = NSEntityDescription.entity(forEntityName: "Hue", in: context)
        //let newAppliance = NSManagedObject(entity: entity!, insertInto: context)
        
        for i in 0..<applianceName.count {
            let newAppliance = Appliance(entity: applianceEntity!, insertInto: context)
            newAppliance.id = UUID()
            newAppliance.name = applianceName[i]
            newAppliance.imageName = imageName[i]
            newAppliance.room = room[i]
            newAppliance.type = type[i]
            newAppliance.voltage = voltage[i]
            
            let settings = Settings(entity: settingsEntity!, insertInto: context)
            settings.id = UUID()
            settings.isOn = isOn[i]
            settings.isPowerSaverOn = isPowerSaverOn[i]
            settings.temparature = Float(temparature[i])
            
            let colorHues = colors[i]
            let hues = NSSet()
            for j in 0..<colorHues.count {
                let hue = Hue(entity: hueEntity!, insertInto: context)
                hue.color = colorHues[j]
                hue.brightness = Float(brightness[i])
                hues.adding(hue)
            }
            settings.addToHueSettings(hues)
            
            newAppliance.settings = settings
        }
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
}
