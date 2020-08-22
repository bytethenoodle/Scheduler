//
//  EventsViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class EventsViewController: ViewController<EventsCoordinator,
                                             EventsState>,
                                            Storyboardable {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView?
    
    var tableDataSource: TableViewDataSource<EventsTableViewCell, Event>?
    
    // MARK: - Action
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
        setupNavigationItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewCoordinator?.store?.dispatch(EventsAction())
    }
    
    // MARK: - View Setups
    
    func setupCollectionViewLayout() {
        tableView?.delegate = self
    }
    
    func setupNavigationItems() {
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                 target: self,
                                                 action: #selector(didTapAddButton(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupTable(events: [Event]) {
        tableDataSource = TableViewDataSource(
            cellIdentifier:String(describing: UITableViewCell.self),
            models: events) {cell, model in
            
            cell.setup(event: model)
            
          return cell
        }
        
        tableView?.register(EventsTableViewCell.self)
        tableView?.dataSource = tableDataSource
        tableView?.reloadData()
    }
    
    // MARK: - Actions
    
    @objc func didTapAddButton(_ sender: Any?) {
        viewCoordinator?.store?.dispatch(EventsAddAction())
    }
}

extension EventsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewCoordinator?.store?.dispatch(EventsEditAction(selectedIndex: indexPath.row))
    }
}
