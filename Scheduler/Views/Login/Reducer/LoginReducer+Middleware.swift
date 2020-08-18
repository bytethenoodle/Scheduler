//
//  LoginReducer+Middleware.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

// MARK: - Middleware Methods

extension LoginReducer {
    
    func middleware() -> Middleware<ReducerStateType> {
        return { dispatch, getState in
            return { next in
                return { action in
                    
                    switch action {
                    case let loginAction as LoginAction:
                        next(LoginProcessAction(loginViewState: self.checkCredentials(username: loginAction.username,
                                                                                      password: loginAction.password)))
                        break
                    default:
                        next(action)
                        break
                    }
                }
            }
        }
    }
    
    func checkCredentials(username: String, password: String) -> LoginViewState {
        guard let errorState = errorStateForInput(username: username,
                                                  password: password)
        else {
            guard let user = UserRepository.get(username: username, password: password) else {
                return .verifyError
            }
            
            return .login
        }
        return errorState
    }
    
    func attachUser() {
        
    }
    
    
}
