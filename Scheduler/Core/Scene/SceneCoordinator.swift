//
//  SceneCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class SceneCoordinator: Coordinator {
    
    typealias StoreSubscriberStateType = SceneState
    typealias CoordinatorStoreType = SceneStore

    lazy var store: CoordinatorStoreType = CoordinatorStoreType(reducer: SceneReducer.reduce)
    
    var window : SceneWindow?

    init(window: SceneWindow? = SceneWindow()) {
        self.window = window
        self.window?.makeKeyAndVisible()

        store.subscribe(self) { $0.select { $0 }}
    }

    func newState(state: StoreSubscriberStateType) {
        switch state.sceneRoute {
        case .login:

            

            break
        default:
            break
        }
    }
}

