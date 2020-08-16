//
//  SceneReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class SceneReducer: Reducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = SceneState
    
    static func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        var state = state ?? ReducerStateType(sceneRoute: .login)

        switch action {
            case let sceneAction as SceneAction:
                state.sceneRoute = sceneAction.sceneRoute
            default:
                break
        }

        return state
    }
}
