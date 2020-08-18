//
//  SessionRepository.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import CoreData

class SessionRepository {
    
    static func fetch() -> Session {
        let managedObjectContext = Persistence.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Session> = Session.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        return (try? managedObjectContext.fetch(fetchRequest).first) ?? create()
    }
    
    static func create() -> Session {
        let managedObjectContext = Persistence.persistentContainer.viewContext

        let newSession = NSEntityDescription.insertNewObject(forEntityName: String(describing: Session.self),
                                                             into: managedObjectContext) as! Session
        do {
            try managedObjectContext.save()
        } catch {
            fatalError("error saving data")
        }
        
        return newSession
    }
}
