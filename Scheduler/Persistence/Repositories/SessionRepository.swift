//
//  SessionRepository.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import CoreData

class SessionRepository {
    
    static func fetch() -> Session? {
        let context = Persistence.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Session> = Session.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        return (try? context.fetch(fetchRequest).first) ?? create()
    }
    
    static func create() -> Session? {
        let context = Persistence.persistentContainer.viewContext

        let newSession = NSEntityDescription.insertNewObject(forEntityName: String(describing: Session.self),
                                                             into: context) as? Session
        try? context.save()
        
        return newSession
    }
    
    static func attachUser(_ user: User) {
        let context = Persistence.persistentContainer.viewContext
        let session = SessionRepository.fetch()
        
        session?.user = user
        
        try? context.save()
    }
    
    static func detachUser() {
        let context = Persistence.persistentContainer.viewContext
        let session = SessionRepository.fetch()
        
        session?.user = nil
        
        try? context.save()
    }
}
