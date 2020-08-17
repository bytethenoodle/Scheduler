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
    var errorTitleLabel: String
    var registerTitleLabel: String
    
    var submitButtonTitleLabel: String
    var registerButtonTitleLabel: String
    
    var keyboardSpec: KeyboardSpec?
        
    var resetFields: Bool
    var showError: Bool
    
    var loginSucceeded: Bool
    var registerButtonTapped: Bool
    
    init() {
        navigationTitle = "Login"
        
        usernameTitleLabel = "Username"
        passwordTitleLabel = "Password"
        errorTitleLabel = String.empty
        registerTitleLabel = "No account yet?"
        
        submitButtonTitleLabel = "Submit"
        registerButtonTitleLabel = "Register"
        
        resetFields = false
        showError = false
        
        loginSucceeded = false
        registerButtonTapped = false
    }
}

