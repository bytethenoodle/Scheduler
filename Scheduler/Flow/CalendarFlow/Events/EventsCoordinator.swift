//
//  EventsCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class EventsCoordinator: ViewCoordinator {
    
    // MARK: - TypeAliaseses
    
    typealias ViewControllerType = EventsViewController
    typealias CoordinatorStoreType = EventsStore
    typealias StoreSubscriberStateType = EventsState
    typealias FlowCoordinatorType = CalendarFlowCoordinator

    // MARK: - Properties
    
    var store: EventsStore?
    
    var flowCoordinator: FlowCoordinatorType?

    weak var viewController: EventsViewController?
    
    // MARK: - Initializations
    
    required init(flowCoordinator: FlowCoordinatorType) {}

    convenience init(flowCoordinator: FlowCoordinatorType, reference: Any?) {
        self.init(flowCoordinator: flowCoordinator)
        let reducer = EventsReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce,
                                          state: EventsState(selectedDate: reference as? Date))
        self.flowCoordinator = flowCoordinator
    }
    
    // MARK: - Lifecycle
    
    func start() {
        guard let eventsViewController = ViewControllerType.instantiateFromStoryboard()
        else { return }
        viewController = eventsViewController
        eventsViewController.viewCoordinator = self
        flowCoordinator?.navigationController?.pushViewController(eventsViewController, animated: true)
    }
    
    func newState(state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}
        
        viewController.navigationItem.title = state.navigationTitle
        
        viewController.setupTable(events: state.events)
        
        switch state.eventsViewState {
        case .showAdd, .showEdit:
            transitionViewWithState(state)
            break
        case .performAdd, .performEdit, .performDelete:
            viewController.refreshView()
            break
        default:
            break
        }
    }
    
    func transitionViewWithState(_ state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}
        
        switch state.eventsViewState {
        case .showAdd:
            viewController.showAddAlert(selectedDate: state.selectedDate)
            break
        case .showEdit:
            guard let selectedIndex = state.selectedIndex else {break}
            viewController.showEditAlert(event: state.events[selectedIndex])
            break
        default:
            break
        }
    }
}
