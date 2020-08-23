//
//  RegistrationFlowCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class RegistrationFlowCoordinator: FlowCoordinator {
    
    // MARK: - Typealiases
    
    typealias CoordinatorStoreType = RegistrationFlowStore
    typealias StoreSubscriberStateType = RegistrationFlowState
    
    // MARK: - Properties
    
    var store: CoordinatorStoreType?
    var navigationController: NavigationController?
    
    weak var sceneCoordinator: SceneCoordinator?

    // MARK: - Initializations
    
    required init(sceneCoordinator: SceneCoordinator) {
        self.sceneCoordinator = sceneCoordinator
                
        store = CoordinatorStoreType(reducer: RegistrationFlowReducer().reduce, state: nil)
        navigationController = (sceneCoordinator.window?.rootViewController as? NavigationController) ?? NavigationController()
        
        store?.subscribe(self) { $0.select { $0 }}
    }
    
    // MARK: - Lifecycle
    
    func start() {
        sceneCoordinator?.window?.rootViewController = navigationController
    }
    
    func newState(state: StoreSubscriberStateType) {
        switch state.registrationFlowRoute {
        case .registrationForm:
            RegistrationCoordinator(flowCoordinator: self).start()
            break
        case .registrationSuccess:
            RegistrationSuccessCoordinator(flowCoordinator: self).start()
            break
        case .loginForm:
            sceneCoordinator?.store?.dispatch(SceneAction(sceneRoute: .login))
            break
        }
    }
}
