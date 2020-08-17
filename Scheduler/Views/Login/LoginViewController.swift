//
//  LoginViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class LoginViewController: KeyboardObservableViewController<LoginCoordinator, LoginState>, Storyboardable {
        
    @IBOutlet weak var usernameTitleLabel: PrimaryLabel?
    @IBOutlet weak var passwordTitleLabel: PrimaryLabel?
    @IBOutlet weak var registerTitleLabel: PrimaryLabel?
    @IBOutlet weak var errorTitleLabel: ErrorLabel?

    @IBOutlet weak var submitButton: PrimaryButton?
    @IBOutlet weak var registerButton: SecondaryButton?
    
    @IBOutlet weak var usernameField: TextField?
    @IBOutlet weak var passwordField: TextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
