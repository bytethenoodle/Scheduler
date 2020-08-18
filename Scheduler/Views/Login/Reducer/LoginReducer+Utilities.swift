//
//  LoginReducer+Utilities.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

// MARK: - Utilities

extension LoginReducer {
    
    internal func errorStateForInput(username: String, password: String) -> LoginViewState? {
        
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
    
    internal func checkCredentials(username: String, password: String) -> LoginViewState {
        guard let errorState = errorStateForInput(username: username,
                                                  password: password)
        else {
            guard let user = UserRepository.get(username: username, password: password) else {
                return .verifyError
            }
            SessionRepository.attachUser(user)
            return .login
        }
        return errorState
    }
}
