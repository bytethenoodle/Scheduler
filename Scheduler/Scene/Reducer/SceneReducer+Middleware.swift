//
//  SceneReducer+Middleware.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

// MARK: - Middleware Methods

extension SceneReducer {
    
    func middleware() -> Middleware<ReducerStateType> {
        return { dispatch, getState in
            return { next in
                return { action in
                    switch action {
                    case var sceneAction as SceneAction:
                        sceneAction.sceneRoute = self.processRouteBasedOnSession(actionRoute: sceneAction.sceneRoute)
                        next(sceneAction)
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
