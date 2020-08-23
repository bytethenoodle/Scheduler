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
        let state = state ?? ReducerStateType(registrationFlowRoute: .registrationForm)
        return state
    }
}
