//
//  SceneWindow.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/15.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class SceneWindow: UIWindow {
    lazy var store = Store<SceneState>(reducer: SceneReducer.reduce,
                                       state: nil)
}
