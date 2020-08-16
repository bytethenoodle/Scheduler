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
        viewController = loginViewController
        loginViewController.viewCoordinator = self

        let navigationController = NavigationController(rootViewController: loginViewController)
        sceneCoordinator?.window?.rootViewController = navigationController
    }
    
    func newState(state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}
        viewController.navigationItem.title = state.navigationTitle
        
        viewController.usernameTitleLabel?.text = state.usernameTitleLabel
        viewController.passwordTitleLabel?.text = state.passwordTitleLabel
        viewController.errorTitleLabel?.text = state.errorTitleLabel
        viewController.registerTitleLabel?.text = state.registerTitleLabel
        
        viewController.submitButton?.setTitle(state.submitButtonTitleLabel, for: UIControl.State())
        viewController.registerButton?.setTitle(state.registerButtonTitleLabel, for: UIControl.State())
        
        guard let keyboardSpec = state.keyboardSpec else {return}
        viewController.adjustScrollViewBottomOffset(keyboardSpec.keyboardHeight,
                                                    animationDuration: keyboardSpec.animationDuration)
    }
}
