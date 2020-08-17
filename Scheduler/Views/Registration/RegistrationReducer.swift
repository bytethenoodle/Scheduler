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
        var state = super.reduce(action: action, state: state)
        
        switch action {
            case let registrationProcessAction as RegistrationProcessAction:
                state.registrationErrorStates = registrationProcessAction.registrationErrorStates
                break
            default:
                break
        }
        
        return state
    }
    
    // MARK: - Middleware Methods
    
    func middleware() -> Middleware<ReducerStateType> {
        return { dispatch, getState in
            return { next in
                return { action in
                    switch action {
                    case _ as RegistrationAction:
                        next(RegistrationProcessAction(registrationErrorStates: [.usernameError]))
                        break
                    default:
                        next(action)
                        break
                    }
                }
            }
        }
    }
}
