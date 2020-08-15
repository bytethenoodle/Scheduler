//
//  ViewCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

//import ReSwift
//
//struct SceneRouteState: StateType {
// 
//    var sceneRoute: SceneRoute
//    
//    init(sceneRoute: SceneRoute = .login) {
//        self.sceneRoute = sceneRoute
//    }
//}

import ReSwift

class ViewCoordinator<T: StateType>: StoreSubscriber {
    
    typealias StoreSubscriberStateType = T
           
    weak var sceneCoordinator: SceneCoordinator?
    
    init(sceneCoordinator: SceneCoordinator) {
        
    }
    
    func newState(state: T) {
        
    }
}
