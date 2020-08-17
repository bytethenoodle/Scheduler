//
//  LoginReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class LoginReducer: KeyboardObservableActionReducer<LoginState> {
    
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
    
    func middleware() -> Middleware<ReducerStateType> {
        return { dispatch, getState in
            return { next in
                return { action in
                    
                    // Handle async call here
                    switch action {
                    case let loginAction as LoginAction:
                        
                        loginAction.username.isEmpty
                        loginAction.password.isEmpty
                        
                        
                        
                        next(LoginProcessAction(loginViewState: .usernameError))
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
