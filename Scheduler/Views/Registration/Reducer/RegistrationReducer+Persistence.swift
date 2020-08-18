//
//  RegistrationReducer+Persistence.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

// MARK: - Persistence

extension RegistrationReducer {
    
    internal func register(username: String, password: String) {
        let managedObjectContext = Persistence.persistentContainer.viewContext
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User",
                                                        into: managedObjectContext) as! User
        
        user.username = username
        user.password = password
        user.events = []
        
        do {
            try managedObjectContext.save()
        } catch {
            fatalError("error saving data")
        }
    }
}
