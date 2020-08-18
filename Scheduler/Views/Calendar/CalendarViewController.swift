//
//  CalendarViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

import UIKit

class CalendarViewController: ViewController<CalendarCoordinator,
                                             CalendarState>,
                              Storyboardable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        
        print("---> \(Date().datesOfMonth().map { $0.dateString() })")
//        print("---> \(Date().endOfMonth().dateString())")
        
    }
    
    func setupNavigationItems() {
        let leftBarButtonItem = UIBarButtonItem(title: "Logout",
                                                style: .plain,
                                                target: self,
                                                action: #selector(leftBarButtonItemTapped(_:)))
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc func leftBarButtonItemTapped(_ sender: Any?) {
        viewCoordinator?.store?.dispatch(CalendarLogoutAction())
    }
}
