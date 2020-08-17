//
//  LoginCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class LoginCoordinator: KeyboardObservableViewCoordinator {
    
    typealias StoreSubscriberStateType = LoginState
    typealias CoordinatorStoreType = LoginStore
    typealias ViewControllerType = LoginViewController
    
    var store: CoordinatorStoreType?
    
    weak var sceneCoordinator: SceneCoordinator?
    
    weak var viewController: ViewControllerType?
    
    required init(sceneCoordinator: SceneCoordinator) {
        let reducer = LoginReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce, state: LoginState(), middleware: [reducer.middleware()])
        self.sceneCoordinator = sceneCoordinator
    }
    
    func start() {
        guard let loginViewController = ViewControllerType.instantiateFromStoryboard() else { return }
        viewController = loginViewController
        loginViewController.viewCoordinator = self

        let navigationController = NavigationController(rootViewController: loginViewController)
        sceneCoordinator?.window?.rootViewController = navigationController
    }
    
    func keyboardObservableNewState(state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}
        viewController.navigationItem.title = state.navigationTitle
        
        viewController.usernameTitleLabel?.text = state.usernameTitleLabel
        viewController.passwordTitleLabel?.text = state.passwordTitleLabel
        viewController.registerTitleLabel?.text = state.registerTitleLabel
        
        viewController.submitButton?.setTitle(state.submitButtonTitleLabel, for: UIControl.State())
        viewController.registerButton?.setTitle(state.registerButtonTitleLabel, for: UIControl.State())
        
        viewController.usernameField?.isError = state.showError
        viewController.passwordField?.isError = state.showError
        
        viewController.errorTitleLabel?.text = state.errorTitleLabel
        viewController.errorTitleLabel?.isHidden = !state.showError
        
        if state.resetFields {
            viewController.usernameField?.text = String.empty
            viewController.passwordField?.text = String.empty
        }
    }
}
