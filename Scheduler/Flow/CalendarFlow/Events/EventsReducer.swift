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
        case let eventsPerformAddAction as EventsPerformAddAction:
            EventRepository.addEvent(date: eventsPerformAddAction.selectedDate,
                                     title: eventsPerformAddAction.inputTitle)
            state.eventsViewState = .performAdd
            break
        case let eventsPerformEditAction as EventsPerformEditAction:
            EventRepository.edit(eventsPerformEditAction.event,
                                 title: eventsPerformEditAction.inputTitle)
            state.eventsViewState = .performEdit
            break
        case let eventsPerformDeleteAction as EventsPerformDeleteAction:
            EventRepository.delete(eventsPerformDeleteAction.event)
            state.eventsViewState = .performDelete
            break
        default:
            break
        }
        
        return state
    }
}
