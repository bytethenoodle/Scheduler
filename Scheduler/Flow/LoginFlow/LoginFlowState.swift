//
//  LoginFlowState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct LoginFlowState: StateType {
    
    var loginFlowRoute: LoginFlowRoute
    var reference: Any?
    
    init(loginFlowRoute: LoginFlowRoute, reference: Any? = nil) {
        self.loginFlowRoute = loginFlowRoute
        self.reference = reference
    }
}
