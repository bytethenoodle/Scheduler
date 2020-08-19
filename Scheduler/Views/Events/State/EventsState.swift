//
//  EventsState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct EventsState: StateType {
    var navigationTitle: String
    var selectedDate: Date?
    
    var selectedIndex: Int?
    
    var eventsViewState: EventsViewState
    
    init(selectedDate: Date? = nil) {
        self.selectedDate = selectedDate
        
        navigationTitle = selectedDate?.dateString() ?? String.empty
        eventsViewState = .normal
    }
    
    var events: [Event] {
        guard let selectedDate = selectedDate else {return []}
        return EventRepository.getEvents(date: selectedDate)
    }
}
