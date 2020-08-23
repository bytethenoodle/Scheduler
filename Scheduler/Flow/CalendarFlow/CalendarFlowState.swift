//
//  CalendarFlowState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct CalendarFlowState: StateType {
    
    var calendarFlowRoute: CalendarFlowRoute
    var reference: Any?
    
    init(calendarFlowRoute: CalendarFlowRoute, reference: Any? = nil) {
        self.calendarFlowRoute = calendarFlowRoute
        self.reference = reference
    }
}
