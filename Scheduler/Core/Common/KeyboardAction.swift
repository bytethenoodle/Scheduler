//
//  KeyboardAction.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

struct KeyboardAction: Action {
    let keyboardFrame: CGRect
    let animationDuration: Double
    
    func getKeyboardSpec() -> KeyboardSpec {
        return KeyboardSpec(keyboardHeight: keyboardFrame.width == UIScreen.main.bounds.width ?
                                            UIScreen.main.bounds.height - keyboardFrame.origin.y : 0.0,
                            animationDuration: animationDuration)
    }
}
