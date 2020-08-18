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
    
    init(selectedDate: Date? = nil) {
        self.selectedDate = selectedDate
        
        navigationTitle = selectedDate?.dateString() ?? String.empty
    }
}
