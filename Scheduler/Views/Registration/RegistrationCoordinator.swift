//
//  RegistrationCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class RegistrationCoordinator: KeyboardObservableViewCoordinator {
    
    typealias ViewControllerType = RegistrationViewController
    
    typealias CoordinatorStoreType = RegistrationStore
    
    typealias StoreSubscriberStateType = RegistrationState
    
    var store: RegistrationStore?
    
    weak var sceneCoordinator: SceneCoordinator?
    
    weak var viewController: RegistrationViewController?
    
    required init(sceneCoordinator: SceneCoordinator) {
        let reducer = RegistrationReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce, state: RegistrationState(), middleware: [reducer.middleware()])
        self.sceneCoordinator = sceneCoordinator
    }
    
    func start() {
        guard let navigationController = sceneCoordinator?.window?.rootViewController as? NavigationController,
              let registrationViewController = ViewControllerType.instantiateFromStoryboard() else { return }
        viewController = registrationViewController
        registrationViewController.viewCoordinator = self
        navigationController.pushViewController(registrationViewController, animated: true)
    }
    
    func keyboardObservableNewState(state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}
        viewController.navigationItem.title = state.navigationTitle
    }
}
