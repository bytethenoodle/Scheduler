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

    lazy var store: CoordinatorStoreType = CoordinatorStoreType(reducer: LoginReducer.reduce)
    
    weak var sceneCoordinator: SceneCoordinator?
    
    weak var viewController: LoginViewController?
        
    required init(sceneCoordinator: SceneCoordinator) {
        self.sceneCoordinator = sceneCoordinator
    }
    
    func start() {
        guard let loginViewController = LoginViewController.instantiateFromStoryboard() else { return }
        let navigationController = UINavigationController(rootViewController: loginViewController)
        sceneCoordinator?.window?.rootViewController = navigationController
    }
    
    func newState(state: StoreSubscriberStateType) {
        
    }
}