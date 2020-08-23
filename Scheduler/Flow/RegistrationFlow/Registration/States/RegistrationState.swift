//
//  RegistrationState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/15.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct RegistrationState: KeyboardObservableStateType {
    
    var navigationTitle: String
    
    var usernameTitleLabel: String
    var passwordTitleLabel: String
    var retypePasswordTitleLabel: String
    
    var usernameHintLabel: String
    var passwordHintLabel: String
    var retypePasswordHintLabel: String
    
    var registerButtonTitleLabel: String

    var keyboardSpec: KeyboardSpec?
    
    var registrationViewState: RegistrationViewState
    var registrationErrorStates: [RegistrationErrorState]

    init() {
        navigationTitle = "Registration"
        
        usernameTitleLabel = "Username"
        passwordTitleLabel = "Password"
        retypePasswordTitleLabel = "Retype Password"
        
        usernameHintLabel = "* Required\n" +
                            "* Must be alphanumeric\n" +
                            "* Must not contain spaces\n" +
                            "* Must be between 8 to 20 characters long"
        passwordHintLabel = "* Required\n" +
                            "* Must be alphanumeric\n" +
                            "* Must have lowercase and uppercase characters\n" +
                            "* Must be at least 8 characters long"
        retypePasswordHintLabel = "* Required\n" +
                                  "* Must be the same with the typed password\n"
        
        registerButtonTitleLabel = "Register"
        
        registrationViewState = .normal
        registrationErrorStates = []
    }
}

extension RegistrationState {
    
    var isVerifyError: Bool {
        registrationErrorStates.contains(.verifyError)
    }
    
    var isUsernameError: Bool {
        registrationErrorStates.contains(.usernameError)
    }
    
    var isPasswordError: Bool {
        registrationErrorStates.contains(.passwordError)
    }
    
    var isRetypePasswordError: Bool {
        registrationErrorStates.contains(.retypePasswordError)
    }
    
    var hasError: Bool {
        !registrationErrorStates.isEmpty
    }
    
    var errorTitleLabel: String {
        switch registrationErrorStates.contains(.verifyError) {
        case true:
            return "Username already exists"
        default:
            return "Please correct the items highlighted in red"
        }
    }
}
