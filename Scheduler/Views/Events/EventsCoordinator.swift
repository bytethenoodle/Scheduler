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
    }
    
    func setupTable(state: EventsState) {
        guard let viewController = viewController else {return}
        viewController.navigationItem.title = state.navigationTitle
        
        viewController.tableDataSource = TableViewDataSource(
            cellIdentifier:String(describing: UITableViewCell.self),
            models: state.events) {cell, model in
            
            cell.textLabel?.text = model.title
            
          return cell
        }
        
        viewController.tableView?.dataSource = viewController.tableDataSource
        viewController.tableView?.reloadData()
    }
}
