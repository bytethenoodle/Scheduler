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
        return { [weak self] dispatch, getState in
            return { [weak self] next in
                return { [weak self] action in
                    switch action {
                    case let registrationAction as RegistrationAction:
                        guard let strongself = self else { break }
                        next(RegistrationProcessAction(registrationErrorStates:
                                                       strongself.performRegistration(registrationAction:
                                                                                      registrationAction)))
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
