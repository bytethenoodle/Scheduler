//
//  EventsViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import RxCocoa

class EventsViewController: ViewController<EventsCoordinator,
                                             EventsState>,
                                            Storyboardable {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView?
    
    var tableDataSource: TableViewDataSource<EventsTableViewCell, Event>?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        setupNavigationItems()
        setupTableView()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshView()
    }
    
    // MARK: - View Setups
    
    func setupTableView() {
        
        // Initialize table view data source
        tableDataSource = TableViewDataSource() { cell, model in
            
            if let model = model {
                cell.setup(event: model)
            }
            
          return cell
        }
        
        // Set data source and delagate to table view
        tableView?.register(EventsTableViewCell.self)
        tableView?.dataSource = tableDataSource
        tableView?.delegate = self
    }
    
    func setupNavigationItems() {
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                 target: self,
                                                 action: #selector(didTapAddButton(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    // MARK: - UI Actions
    
    func refreshView() {
        viewCoordinator?.store?.dispatch(EventsRefreshViewAction())
    }
    
    func refreshList(events: [Event]) {
        tableDataSource?.models = events
        tableView?.reloadData()
    }
    
    // MARK: - User Actions
    
    @objc func didTapAddButton(_ sender: Any?) {
        viewCoordinator?.store?.dispatch(EventsShowAddAction())
    }
    
    @objc func didTapAddAlertAction(selectedDate: Date?, title: String) {
        viewCoordinator?.store?.dispatch(EventsPerformAddAction(selectedDate: selectedDate, inputTitle: title))
    }
    
    @objc func didTapEditAlertAction(event: Event, title: String) {
        viewCoordinator?.store?.dispatch(EventsPerformEditAction(event: event, inputTitle: title))
    }
    
    @objc func didTapDeleteAlertAction(event: Event) {
        viewCoordinator?.store?.dispatch(EventsPerformDeleteAction(event: event))
    }
    
    // MARK: - Alert Setups
    
    func showAddAlert(selectedDate: Date?) {
        
        // Declare elements for alert
        
        var inputTextField: UITextField?
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { _ in
            self.didTapAddAlertAction(selectedDate: selectedDate,
                                      title: inputTextField?.text ?? String.empty)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Setup and show alert
        showAlertWithTextField(title: "Create New Event",
                               message: nil,
                               actions: [saveAction,
                                         cancelAction]) { (textField) in
            textField.placeholder = "Event Title"
            inputTextField = textField
        }
        
        // Observe changes in text input
        
        inputTextField?.rx.text
        .bind {
            saveAction.isEnabled = !($0?.isEmpty() ?? true)
        }
        .disposed(by: disposeBag)
    }
    
    func showEditAlert(event: Event) {
        
        // Declare elements for alert
        
        var inputTextField: UITextField?
        
        let editAction = UIAlertAction(title: "Edit", style: .default, handler: { _ in
            self.didTapEditAlertAction(event: event,
                                       title: inputTextField?.text ?? String.empty)
        })
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.didTapDeleteAlertAction(event: event)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Setup and show alert
        
        showAlertWithTextField(title: "Edit Event",
                               message: nil,
                               actions: [editAction,
                                         deleteAction,
                                         cancelAction]) { (textField) in
            textField.placeholder = "Event Title"
            textField.text = event.title
            inputTextField = textField
        }
        
        // Observe changes in text input
        
        inputTextField?.rx.text
        .bind {
            editAction.isEnabled = !($0?.isEmpty() ?? true)
        }
        .disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDelegate

extension EventsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewCoordinator?.store?.dispatch(EventsShowEditAction(selectedIndex: indexPath.row))
    }
}
