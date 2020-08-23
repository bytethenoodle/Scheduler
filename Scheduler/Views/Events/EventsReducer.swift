//
//  EventsReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class EventsReducer: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = EventsState
    
    func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType()
        state.eventsViewState = .normal
        
        switch action {
        case _ as EventsShowAddAction:
            state.eventsViewState = .showAdd
            break
        case let eventsEditAction as EventsShowEditAction:
            state.eventsViewState = .showEdit
            state.selectedIndex = eventsEditAction.selectedIndex
            break
        default:
            break
        }
        
        return state
    }
}
