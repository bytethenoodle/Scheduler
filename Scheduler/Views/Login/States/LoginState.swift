//
//  LoginState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct LoginState: KeyboardObservableStateType {
    
    var navigationTitle: String
    
    var usernameTitleLabel: String
    var passwordTitleLabel: String
    var registerTitleLabel: String
    
    var submitButtonTitleLabel: String
    var registerButtonTitleLabel: String
    
    var keyboardSpec: KeyboardSpec?
        
    var loginViewState: LoginViewState
    
    init() {
        navigationTitle = "Login"
        
        usernameTitleLabel = "Username"
        passwordTitleLabel = "Password"
        registerTitleLabel = "No account yet?"
        
        submitButtonTitleLabel = "Submit"
        registerButtonTitleLabel = "Register"
        
        loginViewState = .normal
    }
}

extension LoginState {
    
    var isVerifyError: Bool {
        [LoginViewState.verifyError].contains(loginViewState)
    }
    
    var isAllInputError: Bool {
        [LoginViewState.allInputError].contains(loginViewState)
    }
    
    var isUsernameError: Bool {
        [LoginViewState.verifyError,
         LoginViewState.allInputError,
         LoginViewState.usernameError].contains(loginViewState)
    }
    
    var isPasswordError: Bool {
        [LoginViewState.verifyError,
         LoginViewState.allInputError,
         LoginViewState.passwordError].contains(loginViewState)
    }
    
    var hasError: Bool {
        isVerifyError || isAllInputError || isUsernameError || isPasswordError
    }
    
    var errorTitleLabel: String {
        switch loginViewState {
        case .verifyError:
            return "Username and/or password is invalid"
        case .allInputError:
            return "Username and password are required"
        case .usernameError:
            return "Username is required"
        case .passwordError:
            return "Password is required"
        default:
            return String.empty
        }
    }
}

