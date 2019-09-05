//
//  DataManager.swift
//  Write
//
//  Created by Anik on 5/9/19.
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
    
    func fetchDocument() throws -> [Document] {
        let docs = try self.context.fetch(Document.fetchRequest() as NSFetchRequest<Document>)
        return docs
    }
    
    func fetchDocuments(withId documentId: Int16) throws -> [Document] {
        let request = NSFetchRequest<Document>(entityName: "Document")
        request.predicate = NSPredicate(format: "docid = %@", NSNumber(value: documentId))
        
        let docs = try self.context.fetch(request)
        return docs
    }
    
    func insert(doc: Document) throws {
        
        self.context.insert(doc)
        try self.context.save()
    }
    
    func update(doc: Document) throws {
        //user.firstName = "Jack"
        try self.context.save()
    }
    
    func delete(doc: Document) throws {
        self.context.delete(doc)
        try self.context.save()
    }
}
