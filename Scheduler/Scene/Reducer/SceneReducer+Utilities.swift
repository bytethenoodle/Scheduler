//
//  SceneReducer+Utilities.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

extension SceneReducer {
    
    internal func verifyRouteBasedOnSession(actionRoute: SceneRoute) -> SceneRoute {
        switch actionRoute {
        case .calendar, .events, .add, .edit:
            return (fetchSession().user == nil ? .login : actionRoute)
        default:
            return actionRoute
        }
    }
}
