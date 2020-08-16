//
//  ViewControllerCoordinatable.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol ViewControllerCoordinatable where Self: UIViewController {
    
    associatedtype CoordinatorType: Coordinator
     
    var viewCoordinator: CoordinatorType? {get set}
}
