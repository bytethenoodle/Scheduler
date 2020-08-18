//
//  UserRepository.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

// MARK: - Persistence

class UserRepository {
    
    static func exist(username: String) -> Bool {
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
    
    static func register(username: String, password: String) {
        let context = Persistence.persistentContainer.viewContext
        
        let user = NSEntityDescription.insertNewObject(forEntityName: String(describing: User.self),
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
    
    static func get(username: String, password: String) -> User? {
        let context = Persistence.persistentContainer.viewContext
        do {
            let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username == %@ && password == %@", username, password)
            let fetchedResults = try context.fetch(fetchRequest)
            return fetchedResults.first
        }
        catch {
            return nil
        }
    }
}
