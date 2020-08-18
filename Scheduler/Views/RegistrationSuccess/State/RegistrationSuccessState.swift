//
//  RegistrationSuccessState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct RegistrationSuccessState: StateType {
    
    var successLabel: String
    var returnButtonTitle: String

    var registrationSuccessViewState: RegistrationSuccessViewState
    
    init() {
        successLabel = "Registration Successful"
        returnButtonTitle = "Return to Login"
        
        registrationSuccessViewState = .normal
    }
}


