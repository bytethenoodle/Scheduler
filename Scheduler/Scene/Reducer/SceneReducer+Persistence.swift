//
//  SceneReducer+Persistence.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import CoreData

extension SceneReducer {
    
    internal func fetchSession() -> Session {
        let managedObjectContext = Persistence.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Session> = Session.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        return (try? managedObjectContext.fetch(fetchRequest).first) ?? createSession()
    }
    
    internal func createSession() -> Session {
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
