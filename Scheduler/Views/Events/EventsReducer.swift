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
        case _ as EventsAddAction:
            state.eventsViewState = .add
            break
        case _ as EventsEditAction:
            state.eventsViewState = .edit
            break
        default:
            break
        }
        
        return state
    }
}
