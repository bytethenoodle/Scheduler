//
//  ViewCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol ViewCoordinator: Coordinator {
    
    associatedtype FlowCoordinatorType: FlowCoordinator
    associatedtype ViewControllerType: ViewControllerCoordinatable
    
    var flowCoordinator: FlowCoordinatorType? {get set}
    
    var viewController: ViewControllerType? {get set}
    
    init(flowCoordinator: FlowCoordinatorType)
    
    func start()
}
