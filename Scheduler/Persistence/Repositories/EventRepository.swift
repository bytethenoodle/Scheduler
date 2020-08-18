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
}
