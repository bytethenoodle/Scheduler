//
//  LoginCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class LoginCoordinator: KeyboardObservableViewCoordinator {
    
    // MARK: - Typealiases
    
    typealias StoreSubscriberStateType = LoginState
    typealias CoordinatorStoreType = LoginStore
    typealias ViewControllerType = LoginViewController
    typealias FlowCoordinatorType = LoginFlowCoordinator

    // MARK: - Properties
    
    var store: CoordinatorStoreType?
    
    var flowCoordinator: FlowCoordinatorType?
    
    weak var viewController: ViewControllerType?
    
    // MARK: - Initializations
    
    required init(flowCoordinator: FlowCoordinatorType) {
        let reducer = LoginReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce,
                                          state: LoginState(),
                                          middleware: [reducer.middleware()])
        self.flowCoordinator = flowCoordinator
    }
    
    // MARK: - Lifecycle
    
    func start() {
        guard let loginViewController = ViewControllerType.instantiateFromStoryboard() else { return }
        viewController = loginViewController
        loginViewController.viewCoordinator = self

        flowCoordinator?.navigationController?.setViewControllers([loginViewController], animated: true)
    }
    
    func keyboardObservableNewState(state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}
        viewController.navigationItem.title = state.navigationTitle
        
        viewController.usernameTitleLabel?.isError = state.isUsernameError
        viewController.usernameTitleLabel?.text = state.usernameTitleLabel

        viewController.passwordTitleLabel?.isError = state.isPasswordError
        viewController.passwordTitleLabel?.text = state.passwordTitleLabel

        viewController.registerTitleLabel?.text = state.registerTitleLabel
        
        viewController.submitButton?.setTitle(state.submitButtonTitleLabel, for: UIControl.State())
        viewController.registerButton?.setTitle(state.registerButtonTitleLabel, for: UIControl.State())
        
        viewController.usernameField?.isError = state.isUsernameError
        viewController.passwordField?.isError = state.isPasswordError
        
        viewController.errorTitleLabel?.text = state.errorTitleLabel
        viewController.errorTitleLabel?.isHidden = !state.hasError
        
        switch state.loginViewState {
        case .login, .register:
            viewController.usernameField?.text = String.empty
            viewController.passwordField?.text = String.empty
            transitionViewWithState(state)
            break
        default:
            break
        }
    }
    
    func transitionViewWithState(_ state: StoreSubscriberStateType) {
        switch state.loginViewState {
        case .login:
            flowCoordinator?.store?.dispatch(LoginFlowAction(loginFlowRoute: .calendar))
            break
        case .register:
            flowCoordinator?.store?.dispatch(LoginFlowAction(loginFlowRoute: .registrationForm))
            break
        default:
            break
        }
    }
}
