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
    
    // MARK: - Middleware Methods
    
    func middleware() -> Middleware<ReducerStateType> {
        return { dispatch, getState in
            return { next in
                return { [] action in
                    
                    switch action {
                    case let loginAction as LoginAction:
                        
                        guard let errorState = self.errorStateForInput(username: loginAction.username,
                                                                       password: loginAction.password)
                        else {
                            // TODO: Handle async call here
                            next(action)
                            break
                        }
                        next(LoginProcessAction(loginViewState: errorState))
                        break
                    default:
                        next(action)
                        break
                    }
                }
            }
        }
    }
    
    // MARK: - Utilities
    
    private func errorStateForInput(username: String, password: String) -> LoginViewState? {
        
        if username.isEmpty &&
           password.isEmpty {
            return .allInputError
        }
        else if username.isEmpty {
            return .usernameError
        }
        else if password.isEmpty {
            return .passwordError
        }
        
        return nil
    }
}
