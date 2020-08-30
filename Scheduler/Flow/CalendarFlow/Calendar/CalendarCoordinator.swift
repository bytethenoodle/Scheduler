//
//  CalendarCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class CalendarCoordinator: ViewCoordinator {
    
    // MARK: - Typealiases
    
    typealias StoreSubscriberStateType = CalendarState
    typealias CoordinatorStoreType = CalendarStore
    typealias ViewControllerType = CalendarViewController
    typealias FlowCoordinatorType = CalendarFlowCoordinator

    // MARK: - Properties
    
    var store: CalendarStore?
    
    var flowCoordinator: FlowCoordinatorType?

    weak var viewController: CalendarViewController?
    
    // MARK: - Initializations
    
    required init(flowCoordinator: FlowCoordinatorType) {
        let reducer = CalendarReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce,
                                          state: CalendarState())
        self.flowCoordinator = flowCoordinator
    }
    
    // MARK: - Lifecycle
    
    func start() {
        guard let calendarViewController = ViewControllerType.instantiateFromStoryboard()
        else { return }
        viewController = calendarViewController
        calendarViewController.viewCoordinator = self
        flowCoordinator?.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    func newState(state: CalendarState) {
        guard let viewController = viewController else {return}
        
        viewController.navigationItem.title = state.navigationTitle
        
        viewController.monthLabel?.text = state.currentDate.monthYearString()
        
        viewController.refreshList(state.dates)
        
        transitionViewWithState(state)
    }

    func transitionViewWithState(_ state: StoreSubscriberStateType) {
        switch state.calendarViewState {
        case .logout:
            flowCoordinator?.store?.dispatch(CalendarFlowAction(calendarFlowRoute: .logout))
            break
        case .selected:
            flowCoordinator?.store?.dispatch(CalendarFlowAction(calendarFlowRoute: .event,
                                                                reference: state.selectedDate))
        default:
            break
        }
    }
}
