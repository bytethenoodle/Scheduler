//
//  RegistrationReducer+Middleware.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

// MARK: - Middleware Methods

extension RegistrationReducer {
    
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
}
