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
    
    @IBOutlet weak var tableView: UITableView?
    
    var tableDataSource: TableViewDataSource<UITableViewCell, Event>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
        setupNavigationItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewCoordinator?.store?.dispatch(EventsAction())
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
    
    @objc func didTapAddButton(_ sender: Any?) {
        viewCoordinator?.store?.dispatch(EventsAddAction())
    }
}

extension EventsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
