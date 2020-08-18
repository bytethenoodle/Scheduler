//
//  CalendarReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class CalendarReducer: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = CalendarState
    
    func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType()
        
        switch action {
        case _ as CalendarSelectAction:
            state.calendarViewState = .selected
            break
        case _ as CalendarLogoutAction:
            state.calendarViewState = .logout
            break
        default:
            state.calendarViewState = .normal
            break
        }
        
        return state
    }
}
