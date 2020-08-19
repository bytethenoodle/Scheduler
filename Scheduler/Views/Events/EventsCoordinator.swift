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
        
        setupTable(state: state)
        transitionViewWithState(state)
    }
    
    func transitionViewWithState(_ state: StoreSubscriberStateType) {        
        switch state.eventsViewState {
        case .add:
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            setupAlert(alert: alert, event: nil, actions: [
                UIAlertAction(title: "Save", style: .default, handler: { al in
                    let fieldString = alert.textFields?.first?.text ?? String.empty
                    EventRepository.addEvent(date: state.selectedDate, title: fieldString)
                    self.store?.dispatch(EventsAction())
                }),
                UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ])
            break
        case .edit:
            
            guard let selectedIndex = state.selectedIndex else {break}
            let event = state.events[selectedIndex]
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            setupAlert(alert: alert, event: event, actions: [
                UIAlertAction(title: "Save", style: .default, handler: { al in
                    let fieldString = alert.textFields?.first?.text ?? String.empty
                    EventRepository.edit(event, title: fieldString)
                    self.store?.dispatch(EventsAction())
                }),
                UIAlertAction(title: "Delete", style: .default, handler: { al in
                    EventRepository.delete(event)
                    self.store?.dispatch(EventsAction())
                }),
                UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ])
            
            break
        default:
            break
        }
    }
    
    func setupTable(state: EventsState) {
        guard let viewController = viewController else {return}
        viewController.tableDataSource = TableViewDataSource(
            cellIdentifier:String(describing: UITableViewCell.self),
            models: state.events) {cell, model in
            
            cell.textLabel?.text = model.title
            cell.textLabel?.textColor = Color.primaryText
            
          return cell
        }
        
        viewController.tableView?.dataSource = viewController.tableDataSource
        viewController.tableView?.reloadData()
    }
    
    func setupAlert(alert: UIAlertController, event: Event?, actions: [UIAlertAction]) {
        guard let viewController = viewController else {return}
        
        alert.title = event == nil ? "Create Event" : "Edit Event"

        alert.addTextField { (field) in
            field.placeholder = "Title"
            field.text = event?.title
        }
        
        for action in actions {
            alert.addAction(action)
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
