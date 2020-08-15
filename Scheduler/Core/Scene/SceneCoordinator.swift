//
//  SceneCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

open class SceneCoordinator: StoreSubscriber {
    
    public typealias StoreSubscriberStateType = SceneState
    
    open lazy var navigationController: UINavigationController = UINavigationController()
        
    init(window: SceneWindow? = SceneWindow()) {
        window?.rootViewController = navigationController
        window?.store.subscribe(self) { $0.select { $0 }}
        if #available(iOS 13, *) {} else {
            window?.makeKeyAndVisible()
        }
    }
    
    open func newState(state: SceneState) {
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

