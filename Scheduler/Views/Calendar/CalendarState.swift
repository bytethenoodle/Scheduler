//
//  CalendarState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct CalendarState: StateType {
    
    var navigationTitle: String
    var currentDate: Date
    
    var calendarViewState: CalendarViewState
    
    init() {
        navigationTitle = "Calendar"
        currentDate = Date()
        
        calendarViewState = .normal
    }
}

extension CalendarState {
    
    var dates: [Date?] {
        currentDate.calendarArray()
    }
}

