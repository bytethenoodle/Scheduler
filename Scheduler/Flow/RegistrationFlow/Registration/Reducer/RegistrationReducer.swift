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
                registrationProcessAction.registrationErrorStates.isEmpty ? (state.registrationViewState = .registered) :
                                                                            (state.registrationViewState = .normal)
                break
            default:
                break
        }
        
        return state
    }
}
