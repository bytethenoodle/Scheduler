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
    
    var keyboardSpec: KeyboardSpec {
        // For handling keyboard: If frame width is equal to screen bounds, the keyboard is not floating
        // Scroll offset height is based on the keyboard origin
        return KeyboardSpec(keyboardHeight: keyboardFrame.width == UIScreen.main.bounds.width ?
                                            UIScreen.main.bounds.height - keyboardFrame.origin.y : 0.0,
                            animationDuration: animationDuration)
    }
}
