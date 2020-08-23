//
//  RegistrationFlowReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

final class RegistrationFlowReducer: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = RegistrationFlowState
    
    func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType(registrationFlowRoute: .registrationForm)
        switch action {
        case let registrationFlowAction as RegistrationFlowAction:
            state.reference = registrationFlowAction.reference
            state.registrationFlowRoute = registrationFlowAction.registrationFlowRoute
            break
        default:
            break
        }
        return state
    }
}
