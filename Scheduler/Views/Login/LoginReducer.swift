//
//  LoginReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class LoginReducer: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = LoginState
    
    static func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType()
        state.keyboardSpec = nil
        
        switch action {
            case _ as LoginAction:
                break
            case let keyboardAction as KeyboardAction:
                // For handling keyboard: If frame width is equal to screen bounds, the keyboard is not floating
                // Scroll offset height is based on the keyboard origin
                state.keyboardSpec = keyboardAction.getKeyboardSpec()
                break
            default:
                break
        }
        
        return state
    }
}
