//
//  NavigationController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if #available(iOS 13.0, *) {
                return .darkContent
            } else {
                return .default
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    func setupAppearance() {
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = Color.primaryBackground
        navigationBar.barTintColor = Color.primaryBackground
        navigationBar.tintColor = Color.primaryText
        
        navigationBar.titleTextAttributes = [.foregroundColor : Color.navigationTitle as Any,
                                             .font: Font.navigationTitle]
    }
}
