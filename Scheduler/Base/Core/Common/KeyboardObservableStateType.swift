//
//  KeyboardObservableStateType.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol KeyboardObservableStateType: StateType {
    var keyboardSpec: KeyboardSpec? {get set}
    init()
}
