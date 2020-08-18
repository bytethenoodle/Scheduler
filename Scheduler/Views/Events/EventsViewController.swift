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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
    }
    
    func setupCollectionViewLayout() {
        tableView?.delegate = self
    }
}

extension EventsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
