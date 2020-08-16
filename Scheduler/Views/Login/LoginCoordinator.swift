//
//  LoginCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class LoginCoordinator: ViewCoordinator {
    
    typealias StoreSubscriberStateType = LoginState
    typealias CoordinatorStoreType = LoginStore
    typealias ViewControllerType = LoginViewController

    lazy var store: CoordinatorStoreType = CoordinatorStoreType(reducer: LoginReducer.reduce,
                                                                state: nil)
    
    weak var sceneCoordinator: SceneCoordinator?
    
    weak var viewController: LoginViewController?
    
    required init(sceneCoordinator: SceneCoordinator) {
        self.sceneCoordinator = sceneCoordinator
    }
    
    func start() {
        
    }
    
    func newState(state: StoreSubscriberStateType) {
        
    }
}
