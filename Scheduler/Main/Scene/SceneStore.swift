//
//  SceneStore.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class SceneStore: Store<SceneState> {
    static let shared = SceneStore(reducer: SceneReducer.reduce, state: nil)
}



