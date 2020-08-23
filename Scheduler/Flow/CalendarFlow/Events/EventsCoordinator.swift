//
//  EventsCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import RxSwift
import RxCocoa

class EventsCoordinator: ViewCoordinator {
    
    // MARK: - TypeAliaseses
    
    typealias ViewControllerType = EventsViewController
    typealias CoordinatorStoreType = EventsStore
    typealias StoreSubscriberStateType = EventsState
    typealias FlowCoordinatorType = CalendarFlowCoordinator

    // MARK: - Properties
    
    var store: EventsStore?
    
    var disposeBag = DisposeBag()

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

        switch state.eventsViewState {
        case .showAdd:
            showAddAlert(state: state)
            break
        case .showEdit:
            showEditAlert(state: state)
            break
        default:
            break
        }
    }
    
    // MARK: - Alert Setups
    
    func showAddAlert(state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}
        showAlertWithField(title: "Create New Event",
                           fieldPlaceholder: "Event Title") { [weak self] (alert, field) -> [UIAlertAction] in
            
            guard let strongself = self else { return [] }

            let saveAction = UIAlertAction(title: "Save", style: .default, handler: { _ in
                viewController.didTapAddAlertAction(selectedDate: state.selectedDate,
                                                    title: field?.text ?? String.empty)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            field?.rx.text
            .bind {
                saveAction.isEnabled = !($0?.isEmpty() ?? true)
            }
            .disposed(by: strongself.disposeBag)
            
            return [saveAction,
                    cancelAction]
        }
    }
    
    func showEditAlert(state: StoreSubscriberStateType) {
        guard let viewController = viewController,
              let selectedIndex = state.selectedIndex else {return}
        let event = state.events[selectedIndex]
        showAlertWithField(title: "Edit Event",
                           fieldPlaceholder: "Event Title",
                           fieldText: event.title) { [weak self] (alert, field) -> [UIAlertAction] in
            
            guard let strongself = self else { return [] }
            
            let editAction = UIAlertAction(title: "Edit", style: .default, handler: { _ in
                viewController.didTapEditAlertAction(event: event,
                                                     title: field?.text ?? String.empty)
            })
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                viewController.didTapDeleteAlertAction(event: event)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            field?.rx.text
            .bind {
                editAction.isEnabled = !($0?.isEmpty() ?? true)
            }
            .disposed(by: strongself.disposeBag)
            
            return [editAction,
                    deleteAction,
                    cancelAction]
        }
    }
}
