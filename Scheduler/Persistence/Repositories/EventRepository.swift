//
//  EventRepository.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import CoreData

class EventRepository {
    
    static func getEvents(date: Date) -> [Event] {
        guard let user = SessionRepository.fetch().user
        else { return [] }
        
        let context = Persistence.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Event> = Event.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        let userEvents = (try? context.fetch(fetchRequest))?.filter { $0.user == user } ?? []
        return userEvents.filter { $0.date?.dateString() == date.dateString() }
    }
    
    static func addEvent(date: Date?, title: String) {
        let context = Persistence.persistentContainer.viewContext

        let newEvent = NSEntityDescription.insertNewObject(forEntityName: String(describing: Event.self),
                                                           into: context) as! Event
        
        newEvent.title = title
        newEvent.date = date
        newEvent.user = SessionRepository.fetch().user
        
        do {
            try context.save()
        } catch {
            fatalError("error saving data")
        }
    }
    
    static func edit(_ event: Event, title: String) {
        let context = Persistence.persistentContainer.viewContext
        
        event.title = title
        
        do {
            try context.save()
        } catch {
            fatalError("error saving data")
        }
    }
    
    static func delete(_ event: Event) {
        let context = Persistence.persistentContainer.viewContext
        context.delete(event)

        do {
            try context.save()
        } catch {
            fatalError("error delete data")
        }
    }
}
