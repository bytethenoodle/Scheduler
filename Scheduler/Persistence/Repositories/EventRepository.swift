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
        guard let user = SessionRepository.fetch()?.user
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
        newEvent.user = SessionRepository.fetch()?.user
        
        try? context.save()
    }
    
    static func edit(_ event: Event, title: String) {
        let context = Persistence.persistentContainer.viewContext
        
        event.title = title
        
        try? context.save()
    }
    
    static func delete(_ event: Event) {
        let context = Persistence.persistentContainer.viewContext
        context.delete(event)

        try? context.save()
    }
}
