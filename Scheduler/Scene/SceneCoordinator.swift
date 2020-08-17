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

    var store: CoordinatorStoreType?
    
    var window : SceneWindow?
    
    required init(window: SceneWindow? = SceneWindow()) {
        self.store = CoordinatorStoreType(reducer: SceneReducer().reduce)
        self.window = window
        window?.makeKeyAndVisible()

        store?.subscribe(self) { $0.select { $0 }}
    }

    func newState(state: StoreSubscriberStateType) {
        switch state.sceneRoute {
        case .login:
            LoginCoordinator(sceneCoordinator: self).start()
            break
        default:
            break
        }
    }
}

