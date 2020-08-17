//
//  Store.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

extension Store {
    convenience init(reducer: @escaping Reducer<State>) {
        self.init(reducer: reducer, state: nil)
    }
}
