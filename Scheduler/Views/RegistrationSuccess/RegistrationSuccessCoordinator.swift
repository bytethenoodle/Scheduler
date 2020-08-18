//
//  RegistrationSuccessCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class RegistrationSuccessCoordinator: ViewCoordinator {
    
    typealias StoreSubscriberStateType = RegistrationSuccessState
    typealias CoordinatorStoreType = RegistrationSuccessStore
    typealias ViewControllerType = RegistrationSuccessViewController
    
    var store: CoordinatorStoreType?
        
    weak var sceneCoordinator: SceneCoordinator?
    
    weak var viewController: RegistrationSuccessViewController?
    
    required init(sceneCoordinator: SceneCoordinator) {
        let reducer = RegistrationSuccessReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce,
                                          state: RegistrationSuccessState())
        self.sceneCoordinator = sceneCoordinator
    }

    func start() {
        guard let navigationController = sceneCoordinator?.window?.rootViewController as? NavigationController,
              let registrationViewController = ViewControllerType.instantiateFromStoryboard()
        else { return }
        viewController = registrationViewController
        registrationViewController.viewCoordinator = self
        navigationController.pushViewController(registrationViewController, animated: true)
    }
    
    func newState(state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}
        
        viewController.successLabel?.text = state.successLabel
        viewController.returnButton?.setTitle(state.returnButtonTitle, for: UIControl.State())
        
        switch state.registrationSuccessViewState {
        case .login:
            transitionViewWithState(state)
            break
        default:
            break
        }
    }
    
    func transitionViewWithState(_ state: StoreSubscriberStateType) {
        
    }
}

