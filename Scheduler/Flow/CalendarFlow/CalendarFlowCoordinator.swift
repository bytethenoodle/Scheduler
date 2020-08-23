//
//  CalendarFlowCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class CalendarFlowCoordinator: FlowCoordinator {
    
    // MARK: - Typealiases
    
    typealias CoordinatorStoreType = CalendarFlowStore
    typealias StoreSubscriberStateType = CalendarFlowState
    
    // MARK: - Properties
    
    var store: CoordinatorStoreType?
    var navigationController: NavigationController?
    
    weak var sceneCoordinator: SceneCoordinator?

    // MARK: - Initializations
    
    required init(sceneCoordinator: SceneCoordinator) {
        self.sceneCoordinator = sceneCoordinator
                
        store = CoordinatorStoreType(reducer: CalendarFlowReducer().reduce, state: nil)
        navigationController = (sceneCoordinator.window?.rootViewController as? NavigationController) ?? NavigationController()
        
        store?.subscribe(self) { $0.select { $0 }}
    }
    
    // MARK: - Lifecycle
    
    func start() {
        sceneCoordinator?.window?.rootViewController = navigationController
    }
    
    func newState(state: StoreSubscriberStateType) {
        switch state.calendarFlowRoute {
        case .calendar:
            CalendarCoordinator(flowCoordinator: self).start()
            break
        case .event:
            EventsCoordinator(flowCoordinator: self,
                              reference: state.reference).start()
            break
        case .logout:
            sceneCoordinator?.store?.dispatch(SceneAction(sceneRoute: .logout))
            break
        }
    }
}
