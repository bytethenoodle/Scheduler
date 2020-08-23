//
//  SceneReducer+Utilities.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

extension SceneReducer {
    
    internal func processRouteBasedOnSession(actionRoute: SceneRoute) -> SceneRoute {
        switch actionRoute {
        case .calendar:
            return (SessionRepository.fetch().user == nil ? .login : actionRoute)
        case .logout:
            SessionRepository.detachUser()
            return actionRoute
        default:
            return actionRoute
        }
    }
}
