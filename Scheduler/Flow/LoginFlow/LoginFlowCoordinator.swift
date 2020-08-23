//
//  LoginFlowCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class LoginFlowCoordinator: FlowCoordinator {
    
    // MARK: - Typealiases
    
    typealias CoordinatorStoreType = LoginFlowStore
    typealias StoreSubscriberStateType = LoginFlowState
    
    // MARK: - Properties
    
    var store: CoordinatorStoreType?
    var navigationController: NavigationController?
    
    weak var sceneCoordinator: SceneCoordinator?

    // MARK: - Initializations
    
    required init(sceneCoordinator: SceneCoordinator) {
        self.sceneCoordinator = sceneCoordinator
                
        store = CoordinatorStoreType(reducer: LoginFlowReducer().reduce, state: nil)
        navigationController = NavigationController()
        
        store?.subscribe(self) { $0.select { $0 }}
    }
    
    // MARK: - Lifecycle
    
    func start() {
        sceneCoordinator?.window?.rootViewController = navigationController
    }
    
    func newState(state: StoreSubscriberStateType) {
        switch state.loginFlowRoute {
        case .loginForm:
            LoginCoordinator(flowCoordinator: self).start()
            break
        case .registrationForm:
            sceneCoordinator?.store?.dispatch(SceneAction(sceneRoute: .registration))
            break
        case .calendar:
            sceneCoordinator?.store?.dispatch(SceneAction(sceneRoute: .calendar))
            break
        }
    }
}
