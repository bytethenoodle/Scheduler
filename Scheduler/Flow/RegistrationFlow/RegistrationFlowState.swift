//
//  RegistrationFlowState.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct RegistrationFlowState: StateType {
    
    var registrationFlowRoute: RegistrationFlowRoute
    var reference: Any?
    
    init(registrationFlowRoute: RegistrationFlowRoute, reference: Any? = nil) {
        self.registrationFlowRoute = registrationFlowRoute
        self.reference = reference
    }
}
