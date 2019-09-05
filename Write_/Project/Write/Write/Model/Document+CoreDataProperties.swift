//
//  Document+CoreDataProperties.swift
//  
//
//  Created by Anik on 5/9/19.
//
//

import Foundation
import CoreData


extension Document {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document> {
        return NSFetchRequest<Document>(entityName: "Document")
    }

    @NSManaged public var content: NSObject?
    @NSManaged public var date: NSDate?
    @NSManaged public var docid: Int16
    @NSManaged public var title: String?
    @NSManaged public var writer: String?

}
