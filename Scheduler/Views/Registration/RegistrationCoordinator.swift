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
        
        viewController.usernameTitleLabel?.text = state.usernameTitleLabel
        viewController.usernameTitleLabel?.isError = state.isUsernameError || state.isVerifyError
        viewController.passwordTitleLabel?.text = state.passwordTitleLabel
        viewController.passwordTitleLabel?.isError = state.isPasswordError
        viewController.retypePasswordTitleLabel?.text = state.retypePasswordTitleLabel
        viewController.retypePasswordTitleLabel?.isError = state.isRetypePasswordError

        viewController.usernameHintLabel?.text = state.usernameHintLabel
        viewController.usernameHintLabel?.isError = state.isUsernameError || state.isVerifyError
        viewController.passwordHintLabel?.text = state.passwordHintLabel
        viewController.passwordHintLabel?.isError = state.isPasswordError
        viewController.retypePasswordHintLabel?.text = state.retypePasswordHintLabel
        viewController.retypePasswordHintLabel?.isError = state.isRetypePasswordError
        
        viewController.usernameField?.isError = state.isUsernameError || state.isVerifyError
        viewController.passwordField?.isError = state.isPasswordError
        viewController.retypePasswordField?.isError = state.isRetypePasswordError

        viewController.registerButton?.setTitle(state.registerButtonTitleLabel, for: UIControl.State())
        
        viewController.errorTitleLabel?.text = state.errorTitleLabel
        viewController.errorTitleLabel?.isHidden = !state.hasError
    }
}
