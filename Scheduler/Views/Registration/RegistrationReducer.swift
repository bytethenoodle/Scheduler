//
//  RegistrationReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class RegistrationReducer: KeyboardObservableActionReducer<RegistrationState> {
    
    // MARK: - Reducer Methods
    
    override func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        let state = super.reduce(action: action, state: state)
        return state
    }
    
    // MARK: - Middleware Methods
    
    func middleware() -> Middleware<ReducerStateType> {
        return { dispatch, getState in
            return { next in
                return { action in
                    next(action)
                }
            }
        }
    }
}
