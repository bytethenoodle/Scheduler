//
//  ViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class ViewController<C: Coordinator, S: StateType>: UIViewController, ViewControllerCoordinatable {
    
    typealias CoordinatorType = C
    
    var viewCoordinator: C?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if #available(iOS 13.0, *) {
                return .darkContent
            } else {
                return .default
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setAppearance()
        subscribeStore()
    }
    
    deinit {
        unsubscribeStore()
    }
    
    private func setAppearance() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: String.empty, style: .plain, target: nil, action: nil)
    }
    
    private func subscribeStore() {
        guard let viewCoordinator = viewCoordinator else {return}
        (viewCoordinator.store as? Store<S>)?.subscribe(viewCoordinator) { $0.select { $0 as! C.StoreSubscriberStateType }}
    }
    
    private func unsubscribeStore() {
        guard let viewCoordinator = viewCoordinator else {return}
        (viewCoordinator.store as? Store<S>)?.unsubscribe(viewCoordinator)
    }
}
