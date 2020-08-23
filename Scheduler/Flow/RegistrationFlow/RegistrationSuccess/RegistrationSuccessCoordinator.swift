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
    typealias FlowCoordinatorType = RegistrationFlowCoordinator

    var store: CoordinatorStoreType?
        
    var flowCoordinator: FlowCoordinatorType?

    weak var viewController: RegistrationSuccessViewController?
    
    required init(flowCoordinator: FlowCoordinatorType) {
        let reducer = RegistrationSuccessReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce,
                                          state: RegistrationSuccessState())
        self.flowCoordinator = flowCoordinator
    }

    func start() {
        guard let registrationSuccessViewController = ViewControllerType.instantiateFromStoryboard()
        else { return }
        viewController = registrationSuccessViewController
        registrationSuccessViewController.viewCoordinator = self
        flowCoordinator?.navigationController?.pushViewController(registrationSuccessViewController, animated: true)
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
        switch state.registrationSuccessViewState {
        case .login:
            flowCoordinator?.store?.dispatch(RegistrationFlowAction(registrationFlowRoute: .loginForm))
            break
        default:
            break
        }
    }
}

