//
//  LoginCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

open class LoginCoordinator: StoreSubscriber {
    
    public typealias StoreSubscriberStateType = LoginState
    
    
    
    init() {
//        SceneStore.shared.subscribe(self) {
//            $0.select {
//                $0.loginState
//            }
//        }
    }
    
    open func newState(state: LoginState) {
        
    }
}
