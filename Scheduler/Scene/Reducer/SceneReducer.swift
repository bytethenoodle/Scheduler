//
//  SceneReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

final class SceneReducer: ActionReducer {
    
    typealias ActionType = Action
    typealias ReducerStateType = SceneState
    
    func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType {
        
        // Handle entry point on launch based on user session
        let session = SessionRepository.fetch()
        var state = state ??
            (session?.user == nil ?
                ReducerStateType(sceneRoute: .login) : ReducerStateType(sceneRoute: .calendar))
                
        // Perform passing from action
        switch action {
            case let sceneAction as SceneAction:
                state.sceneRoute = sceneAction.sceneRoute
                state.reference = sceneAction.reference
                break
            default:
                break
        }
        
        return state
    }
}
