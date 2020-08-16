//
//  SceneState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct SceneState: StateType {
    
    var sceneRoute: SceneRoute
    
    init(sceneRoute: SceneRoute) {
        self.sceneRoute = sceneRoute
    }
}