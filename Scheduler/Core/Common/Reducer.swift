//
//  Reducer.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/15.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol Reducer {
    
    associatedtype ActionType
    associatedtype ReducerStateType

    static func reduce(action: ActionType, state: ReducerStateType?) -> ReducerStateType
}
