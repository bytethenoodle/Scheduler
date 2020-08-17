//
//  KeyboardObservableViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class KeyboardObservableViewController<C: Coordinator, S: KeyboardObservableStateType>: ViewController<C,S>  {
    
    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView?
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observeKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unobserveKeyboard()
    }
    
    // MARK: - Keyboard
    
    private func observeKeyboard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFrame(_:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil
        )
    }
    
    private func unobserveKeyboard() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillChangeFrameNotification,
                                                  object: nil)
    }
    
    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        guard
        let keyboardFrame =
            notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
        let duration =
            notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else {return}
        
        let keyboardRectangle = keyboardFrame.cgRectValue
        keyboardFrameChanged(keyboardFrame: keyboardRectangle, animationDuration: duration)
    }
    
    // MARK: - Return Methods From Observers
    
    func keyboardFrameChanged(keyboardFrame: CGRect, animationDuration: Double) {
        (viewCoordinator?.store as? Store<S>)?.dispatch(KeyboardAction(keyboardFrame:
                                                                       keyboardFrame, animationDuration: animationDuration))
    }
    
    // MARK: - Utilities
    
    func adjustScrollViewBottomOffset(_ bottomOffset: CGFloat, animationDuration: Double) {
        guard let scrollView = scrollView else {return}
        var contentInset = scrollView.contentInset
        var scrollIndicatorInsets = scrollView.scrollIndicatorInsets
        contentInset.bottom = bottomOffset
        scrollIndicatorInsets.bottom = bottomOffset
        
        UIView.animate(withDuration: animationDuration) {
            scrollView.scrollIndicatorInsets = scrollIndicatorInsets
            scrollView.contentInset = contentInset
        }
    }
}
