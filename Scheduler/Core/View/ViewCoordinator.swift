//
//  ViewCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol ViewCoordinator: Coordinator {
    
    associatedtype ViewControllerType: ViewControllerCoordinatable
    
    var sceneCoordinator: SceneCoordinator? {get set}
    
    var viewController: ViewControllerType? {get set}
    
    init(sceneCoordinator: SceneCoordinator)
}
