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
    
    internal func doesUsernameExist(username: String) -> Bool {
        let context = Persistence.persistentContainer.viewContext
        do {
            let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username == %@", username)
            let fetchedResults = try context.fetch(fetchRequest)
            return !fetchedResults.isEmpty
        }
        catch {
            fatalError("fetch task failed")
        }
    }
    
    internal func register(username: String, password: String) {
        let context = Persistence.persistentContainer.viewContext
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User",
                                                        into: context) as! User
        
        user.username = username
        user.password = password
        user.events = []
        
        do {
            try context.save()
        } catch {
            fatalError("error saving data")
        }
    }
}
