//
//  KeyboardObservableActionReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class KeyboardObservableActionReducer<S: KeyboardObservableStateType>: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = S
    
    func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType()
        state.keyboardSpec = nil
        
        switch action {
            case let keyboardAction as KeyboardAction:
                state.keyboardSpec = keyboardAction.keyboardSpec
                break
            default:
                break
        }
        
        return state
    }
}
