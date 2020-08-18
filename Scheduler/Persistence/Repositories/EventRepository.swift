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
        guard let allUserEvents = SessionRepository.fetch().user?.events.array(of: Event.self)
        else {
            return []
        }
        return []
    }
}
