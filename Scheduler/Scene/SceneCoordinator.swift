//
//  SceneCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class SceneCoordinator: Coordinator {
    
    // MARK: - Typealiases
    
    typealias StoreSubscriberStateType = SceneState
    typealias CoordinatorStoreType = SceneStore

    // MARK: - Properties
    
    var store: CoordinatorStoreType?
    
    var window : SceneWindow?
    
    // MARK: - Initializations
    
    required init(window: SceneWindow? = SceneWindow()) {
        let sceneReducer = SceneReducer()
        store = CoordinatorStoreType(reducer: sceneReducer.reduce,
                                     state: nil,
                                     middleware: [sceneReducer.middleware()])
        self.window = window
        window?.makeKeyAndVisible()

        store?.subscribe(self) { $0.select { $0 }}
    }

    // MARK: - Lifecycle
    
    func newState(state: StoreSubscriberStateType) {
        switch state.sceneRoute {
        case .login, .logout:
            LoginFlowCoordinator(sceneCoordinator: self).start()
            break
        case .registration:
            RegistrationFlowCoordinator(sceneCoordinator: self).start()
            break
        case .calendar:
            CalendarFlowCoordinator(sceneCoordinator: self).start()
            break
        }
    }
}

