//
//  LoginReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class LoginReducer: KeyboardObservableActionReducer<LoginState> {
    
    override func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = super.reduce(action: action, state: state)
                
        switch action {
            case _ as LoginRegisterAction:
                
                break
            default:
                break
        }
        
        return state
    }
    
    func middleware() -> Middleware<ReducerStateType> {
        return { dispatch, getState in
            return { next in
                return { action in
                    
                    // Handle async call here
                    switch action {
                    case _ as LoginAction:
                        
                        break
                    default:
                        break
                    }
                    next(action)
                }
            }
        }
    }
}
