//
//  Persistence.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import CoreData

class Persistence {
    
    // MARK: - Core Data Stack

    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Scheduler")
        container.loadPersistentStores(completionHandler: { (_, _) in })
        return container
    }()

    // MARK: - Core Data Saving Support

    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try? context.save()
        }
    }
}
