//
//  LoginFlowReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

final class LoginFlowReducer: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = LoginFlowState
    
    func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType(loginFlowRoute: .loginForm)
        switch action {
        case let loginFlowAction as LoginFlowAction:
            state.reference = loginFlowAction.reference
            state.loginFlowRoute = loginFlowAction.loginFlowRoute
            break
        default:
            break
        }
        return state
    }
}
