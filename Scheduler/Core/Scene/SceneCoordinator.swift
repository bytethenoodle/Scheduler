//
//  SceneCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

final class SceneCoordinator: StoreSubscriber {
    
    typealias StoreSubscriberStateType = SceneState
           
    var window : SceneWindow?
    
    init(window: SceneWindow? = SceneWindow()) {
        self.window = window
        
        window?.store.subscribe(self) { $0.select { $0 }}
        window?.makeKeyAndVisible()
    }
    
    func newState(state: SceneState) {
        switch state.sceneRoute {
        case .login:
            
            
            
            break
        default:
            break
        }
        
        
        
//        let vc = UIStoryboard(name: String(describing: LoginViewController.self), bundle: .main).instantiateViewController(identifier: String(describing: LoginViewController.self))
//        window?.rootViewController = vc
//        window?.makeKeyAndVisible()
    }
}

