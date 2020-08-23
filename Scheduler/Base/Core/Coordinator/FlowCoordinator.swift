//
//  FlowCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol FlowCoordinator: Coordinator {
        
    var sceneCoordinator: SceneCoordinator? {get set}
    
    var navigationController: NavigationController? {get set}
    
    init(sceneCoordinator: SceneCoordinator)
    
    func start()
}
