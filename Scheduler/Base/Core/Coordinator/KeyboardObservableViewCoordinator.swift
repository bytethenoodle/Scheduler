//
//  KeyboardObservableViewCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol KeyboardObservableViewCoordinator: ViewCoordinator where StoreSubscriberStateType: KeyboardObservableStateType {
    func keyboardObservableNewState(state: StoreSubscriberStateType)
}

extension KeyboardObservableViewCoordinator {
    func newState(state: StoreSubscriberStateType) {
        
        guard let viewController = viewController,
        let keyboardSpec = state.keyboardSpec else {
            // Notify state change only if it is not a keyboard action
            keyboardObservableNewState(state: state)
            return
        }
        (viewController as? KeyboardObservableViewController<Self, StoreSubscriberStateType>)?
            .adjustScrollViewBottomOffset(keyboardSpec.keyboardHeight,
                                          animationDuration: keyboardSpec.animationDuration)
    }
}
