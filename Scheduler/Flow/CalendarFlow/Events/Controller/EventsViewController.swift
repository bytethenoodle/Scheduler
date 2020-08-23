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
    
    // MARK: - Action
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
        setupNavigationItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshView()
    }
    
    // MARK: - View Setups
    
    func refreshView() {
        viewCoordinator?.store?.dispatch(EventsRefreshViewAction())
    }
    
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
        showAlertWithField(title: "Create New Event",
                           fieldPlaceholder: "Event Title") { [weak self] (alert, field) -> [UIAlertAction] in
            
            guard let strongself = self else { return [] }

            let saveAction = UIAlertAction(title: "Save", style: .default, handler: { _ in
                strongself.didTapAddAlertAction(selectedDate: selectedDate,
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
    
    func showEditAlert(event: Event) {
        showAlertWithField(title: "Edit Event",
                           fieldPlaceholder: "Event Title",
                           fieldText: event.title) { [weak self] (alert, field) -> [UIAlertAction] in
            
            guard let strongself = self else { return [] }
            
            let editAction = UIAlertAction(title: "Edit", style: .default, handler: { _ in
                strongself.didTapEditAlertAction(event: event,
                                                     title: field?.text ?? String.empty)
            })
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                strongself.didTapDeleteAlertAction(event: event)
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

extension EventsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewCoordinator?.store?.dispatch(EventsShowEditAction(selectedIndex: indexPath.row))
    }
}
