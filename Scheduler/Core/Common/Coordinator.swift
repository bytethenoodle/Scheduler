//
//  Coordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/15.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol Coordinator: StoreSubscriber {
    
    associatedtype CoordinatorStoreType
    
    var store: CoordinatorStoreType { get set }
}
