//
//  SceneCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class SceneCoordinator: StoreSubscriber {
    
    typealias StoreSubscriberStateType = SceneRouteState
    
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        
        SceneStore.shared.subscribe(self) {
            $0.select {
                $0.sceneRouteState
            }
        }
    }
    
    func newState(state: SceneRouteState) {
        
    }
}

