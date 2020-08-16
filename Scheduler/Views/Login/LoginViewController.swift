//
//  LoginViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController, ViewControllerCoordinatable {
    
    typealias CoordinatorType = LoginCoordinator

    var viewCoordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

