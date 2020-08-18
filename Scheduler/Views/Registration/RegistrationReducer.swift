//
//  RegistrationReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class RegistrationReducer: KeyboardObservableActionReducer<RegistrationState> {
    
    // MARK: - Reducer Methods
    
    override func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = super.reduce(action: action, state: state)
        
        switch action {
            case let registrationProcessAction as RegistrationProcessAction:
                state.registrationErrorStates = registrationProcessAction.registrationErrorStates
                registrationProcessAction.registrationErrorStates.isEmpty ? (state.registrationViewState = .register) :
                                                                            (state.registrationViewState = .normal)
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
                return { action in
                    switch action {
                    case let registrationAction as RegistrationAction:
                        var errors = [RegistrationErrorState]()
                        errors.append(contentsOf: self.formatErrorsFor(username: registrationAction.username,
                                                                       password: registrationAction.password))
                        errors.append(contentsOf: self.checkErrorForRetypePassword(password: registrationAction.password,
                                                                                   retypePassword: registrationAction.retypePassword))
                        next(RegistrationProcessAction(registrationErrorStates: errors))
                        break
                    default:
                        next(action)
                        break
                    }
                }
            }
        }
    }
    
    private func formatErrorsFor(username: String, password: String) -> [RegistrationErrorState] {
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
    
    private func checkErrorForRetypePassword(password: String, retypePassword: String) -> [RegistrationErrorState] {
        if (password != retypePassword) || (retypePassword.isEmpty) {
            return [.retypePasswordError]
        }
        else {
            return []
        }
    }
}
