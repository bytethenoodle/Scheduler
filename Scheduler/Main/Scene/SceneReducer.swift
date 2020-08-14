//
//  SceneReducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class SceneReducer {
    
    static func reduce(action: Action, state: SceneState?) -> SceneState {
        return SceneState(sceneRouteState: SceneRouteReducer.reduce(action: action, state: state?.sceneRouteState),
                          loginState: LoginReducer.reduce(action: action, state: state?.loginState))
    }
}
