//
//  LoginCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class LoginCoordinator: Coordinator {
    
    typealias StoreSubscriberStateType = LoginState
    typealias CoordinatorStoreType = LoginStore

    lazy var store: CoordinatorStoreType = CoordinatorStoreType(reducer: LoginReducer.reduce,
                                                                state: nil)
    
    init() {
//        SceneStore.shared.subscribe(self) {
//            $0.select {
//                $0.loginState
//            }
//        }
    }
    
    func newState(state: StoreSubscriberStateType) {
        
    }
}
