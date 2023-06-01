//
//  CoreDataManager.swift
//  ProtoLife
//
//  Created by Joseph DeWeese on 6/1/23.
//

import Foundation
import CoreData


class CoreDataManager  {
    
    static let shared = CoreDataManager()
    private var persistentContainer:  NSPersistentContainer
    
    private init( )  {
        persistentContainer = NSPersistentContainer(name: "DailyBudget")
        persistentContainer.loadPersistentStores {  description, error in
            if let error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}
        
