//
//  SceneState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

public struct SceneState: StateType {
    
    public var sceneRoute: SceneRoute
    
    public init(sceneRoute: SceneRoute) {
        self.sceneRoute = sceneRoute
    }
}
