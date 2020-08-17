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
    
    var keyboardSpec: KeyboardSpec?
    
    init() {
        navigationTitle = "Registration"
        
        usernameTitleLabel = "Username"
        passwordTitleLabel = "Password"
        retypePasswordTitleLabel = "Retype Password"
    }
}
