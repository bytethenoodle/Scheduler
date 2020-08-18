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
        let sceneReducer = SceneReducer()
        self.store = CoordinatorStoreType(reducer: sceneReducer.reduce,
                                          state: nil,
                                          middleware: [sceneReducer.middleware()])
        self.window = window
        window?.makeKeyAndVisible()

        store?.subscribe(self) { $0.select { $0 }}
    }

    func newState(state: StoreSubscriberStateType) {
        switch state.sceneRoute {
        case .login:
            LoginCoordinator(sceneCoordinator: self).start()
            break
        case .registration:
            RegistrationCoordinator(sceneCoordinator: self).start()
            break
        case .registrationSuccess:
            RegistrationSuccessCoordinator(sceneCoordinator: self).start()
            break
        case .calendar:
            CalendarCoordinator(sceneCoordinator: self).start()
            break
        default:
            break
        }
    }
}

