//
//  CalendarCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class CalendarCoordinator: ViewCoordinator {
    
    typealias StoreSubscriberStateType = CalendarState
    typealias CoordinatorStoreType = CalendarStore
    typealias ViewControllerType = CalendarViewController
    
    var store: CalendarStore?
    
    weak var sceneCoordinator: SceneCoordinator?
    
    weak var viewController: CalendarViewController?
    
    required init(sceneCoordinator: SceneCoordinator) {
        let reducer = CalendarReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce,
                                          state: CalendarState())
        self.sceneCoordinator = sceneCoordinator
    }
    
    func start() {
        guard let calendarViewController = ViewControllerType.instantiateFromStoryboard() else { return }
        viewController = calendarViewController
        calendarViewController.viewCoordinator = self

        let navigationController = NavigationController(rootViewController: calendarViewController)
        sceneCoordinator?.window?.rootViewController = navigationController
    }
    
    func newState(state: CalendarState) {
        guard let viewController = viewController else {return}
        viewController.navigationItem.title = state.navigationTitle
    }
}