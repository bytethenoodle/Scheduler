//
//  ViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import RxSwift

class ViewController<C: Coordinator, S: StateType>: UIViewController, ViewControllerCoordinatable {
    
    // MARK: - Typealiases
    
    typealias CoordinatorType = C
    
    // MARK: - Properties
    
    var viewCoordinator: C?
    
    var disposeBag = DisposeBag()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if #available(iOS 13.0, *) {
                return .darkContent
            } else {
                return .default
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setAppearance()
        subscribeStore()
    }
    
    deinit {
        unsubscribeStore()
    }
    
    // MARK: - Setups
    
    private func setAppearance() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: String.empty, style: .plain,
                                                           target: nil, action: nil)
    }
    
    // MARK: - Subscription
    
    private func subscribeStore() {
        guard let viewCoordinator = viewCoordinator else {return}
        (viewCoordinator.store as? Store<S>)?.subscribe(viewCoordinator) {
            $0.select { $0 as! C.StoreSubscriberStateType }}
    }
    
    private func unsubscribeStore() {
        guard let viewCoordinator = viewCoordinator else {return}
        (viewCoordinator.store as? Store<S>)?.unsubscribe(viewCoordinator)
    }
}
