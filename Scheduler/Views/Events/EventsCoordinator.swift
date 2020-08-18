//
//  EventsCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class EventsCoordinator: ViewCoordinator {
    
    typealias ViewControllerType = EventsViewController
    
    typealias CoordinatorStoreType = EventsStore
    
    typealias StoreSubscriberStateType = EventsState
    
    var store: EventsStore?
    
    weak var sceneCoordinator: SceneCoordinator?
    
    weak var viewController: EventsViewController?
    
    required init(sceneCoordinator: SceneCoordinator) {
        
    }
    
    convenience init(sceneCoordinator: SceneCoordinator, reference: Any?) {
        self.init(sceneCoordinator: sceneCoordinator)
    }
    
    func start() {
        
    }
    
    
    
    func newState(state: EventsState) {
        
    }
}
