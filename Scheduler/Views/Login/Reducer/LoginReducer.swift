//
//  LoginReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class LoginReducer: KeyboardObservableActionReducer<LoginState> {
    
    // MARK: - Reducer Methods
    
    override func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = super.reduce(action: action, state: state)
        
        switch action {
            case _ as LoginRegisterAction:
                state.loginViewState = .register
                break
            case let loginProcessAction as LoginProcessAction:
                state.loginViewState = loginProcessAction.loginViewState
                break
            default:
                break
        }
        
        return state
    }
}
