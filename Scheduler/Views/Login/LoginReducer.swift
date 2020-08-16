//
//  LoginReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class LoginReducer: Reducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = LoginState
    
    static func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        let state = state ?? ReducerStateType()
        return state
    }
}
