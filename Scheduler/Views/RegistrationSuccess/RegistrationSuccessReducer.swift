//
//  RegistrationSuccessReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class RegistrationSuccessReducer: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = RegistrationSuccessState
    
    func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType()

        return state
    }
}
