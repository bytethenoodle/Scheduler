//
//  CalendarFlowReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

final class CalendarFlowReducer: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = CalendarFlowState
    
    func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType(calendarFlowRoute: .calendar)
        switch action {
        case let calendarFlowAction as CalendarFlowAction:
            state.reference = calendarFlowAction.reference
            state.calendarFlowRoute = (SessionRepository.fetch()?.user == nil ?
                                        .logout : calendarFlowAction.calendarFlowRoute)
            break
        default:
            break
        }
        return state
    }
}
