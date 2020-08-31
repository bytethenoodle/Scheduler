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
        return { [weak self] dispatch, getState in
            return { [weak self] next in
                return { [weak self] action in
                    switch action {
                    case var sceneAction as SceneAction:
                        guard let strongself = self else { break }
                        sceneAction.sceneRoute = strongself.processRouteBasedOnSession(actionRoute: sceneAction.sceneRoute)
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
