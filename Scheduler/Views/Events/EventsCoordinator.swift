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
    
    typealias ViewControllerType = EventsViewController
    
    typealias CoordinatorStoreType = EventsStore
    
    typealias StoreSubscriberStateType = EventsState
    
    var store: EventsStore?
    
    var disposeBag = DisposeBag()

    weak var sceneCoordinator: SceneCoordinator?
    
    weak var viewController: EventsViewController?
    
    required init(sceneCoordinator: SceneCoordinator) {}
    
    convenience init(sceneCoordinator: SceneCoordinator, reference: Any?) {
        self.init(sceneCoordinator: sceneCoordinator)
        let reducer = EventsReducer()
        self.store = CoordinatorStoreType(reducer: reducer.reduce,
                                          state: EventsState(selectedDate: reference as? Date))
        self.sceneCoordinator = sceneCoordinator
    }
    
    func start() {
        guard let navigationController = sceneCoordinator?.window?.rootViewController as? NavigationController,
              let eventsViewController = ViewControllerType.instantiateFromStoryboard()
        else { return }
        viewController = eventsViewController
        eventsViewController.viewCoordinator = self
        navigationController.pushViewController(eventsViewController, animated: true)
    }
    
    func newState(state: EventsState) {
        guard let viewController = viewController else {return}
        
        viewController.navigationItem.title = state.navigationTitle
        
        viewController.setupTable(events: state.events)
        
        transitionViewWithState(state)
    }
    
    func transitionViewWithState(_ state: StoreSubscriberStateType) {
        guard let viewController = viewController else {return}

        switch state.eventsViewState {
        case .showAdd:
            showAlertWithField(title: "Create New Event",
                               fieldPlaceholder: "Event Title") { [weak self] (alert, field) -> [UIAlertAction] in
                
                guard let strongself = self else { return [] }

                let saveAction = UIAlertAction(title: "Save", style: .default, handler: { al in
                    let fieldString = field?.text ?? String.empty
                    EventRepository.addEvent(date: state.selectedDate, title: fieldString)
                    strongself.store?.dispatch(EventsRefreshViewAction())})
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                field?.rx.text
                .bind {
                    saveAction.isEnabled = !($0?.isEmpty() ?? true)
                }
                .disposed(by: strongself.disposeBag)
                
                return [saveAction,
                        cancelAction]
            }
            break
        case .showEdit:
            
            guard let selectedIndex = state.selectedIndex else {break}
            let event = state.events[selectedIndex]
            showAlertWithField(title: "Edit Event",
                               fieldPlaceholder: "Event Title",
                               fieldText: event.title) { [weak self] (alert, field) -> [UIAlertAction] in
                
                guard let strongself = self else { return [] }
                
                let editAction = UIAlertAction(title: "Edit", style: .default, handler: { al in
                    let fieldString = field?.text ?? String.empty
                    EventRepository.edit(event, title: fieldString)
                    strongself.store?.dispatch(EventsRefreshViewAction())
                })
                let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { al in
                    EventRepository.delete(event)
                    strongself.store?.dispatch(EventsRefreshViewAction())
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
            
            break
        default:
            break
        }
    }
}
