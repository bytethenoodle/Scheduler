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
        let state = super.reduce(action: action, state: state)
        
        switch action {
            case _ as LoginAction:
                break
            default:
                break
        }
        
        return state
    }
}
