//
//  LoginReducer+Middleware.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

// MARK: - Middleware Methods

extension LoginReducer {
    
    func middleware() -> Middleware<ReducerStateType> {
        return { [weak self] dispatch, getState in
            return { [weak self] next in
                return { [weak self] action in
                    switch action {
                    case let loginAction as LoginAction:
                        guard let strongself = self else { break }
                        next(LoginProcessAction(loginViewState: strongself.checkCredentials(username: loginAction.username,
                                                                                            password: loginAction.password)))
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
