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
    
    var isAllError: Bool {
        [LoginViewState.allError].contains(loginViewState)
    }
    
    var isUsernameError: Bool {
        [LoginViewState.allError,
         LoginViewState.usernameError].contains(loginViewState)
    }
    
    var isPasswordError: Bool {
        [LoginViewState.allError,
         LoginViewState.passwordError].contains(loginViewState)
    }
    
    var hasError: Bool {
        isAllError || isUsernameError || isPasswordError
    }
    
    var errorTitleLabel: String {
        switch loginViewState {
        case .allError:
            return "Username and/or password is invalid"
        case .usernameError:
            return "Username is required"
        case .passwordError:
            return "Password is required"
        default:
            return String.empty
        }
    }
    
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

