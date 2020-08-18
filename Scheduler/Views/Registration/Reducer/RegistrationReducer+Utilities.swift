//
//  RegistrationReducer+Utilities.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

// MARK: - Utilities

extension RegistrationReducer {
    
    internal func formatErrorsFor(username: String, password: String) -> [RegistrationErrorState] {
        var errors = [RegistrationErrorState]()
        if !(username.isAlphanumeric() && username.hasNoSpace() && username.isValidUsernameRange() &&
            username.hasNoSpace()) {
            errors.append(.usernameError)
        }
        if !(password.isAlphanumeric() && password.hasLowerLetter() && password.hasUpperLetter() &&
            password.isValidPasswordRange()) {
            errors.append(.passwordError)
        }
        return errors
    }
    
    internal func checkErrorForRetypePassword(password: String, retypePassword: String) -> [RegistrationErrorState] {
        if (password != retypePassword) || (retypePassword.isEmpty) {
            return [.retypePasswordError]
        }
        else {
            return []
        }
    }
}
