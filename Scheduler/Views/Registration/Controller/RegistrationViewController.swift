//
//  RegistrationViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class RegistrationViewController: KeyboardObservableViewController<RegistrationCoordinator, RegistrationState>, Storyboardable, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTitleLabel: PrimaryLabel?
    @IBOutlet weak var passwordTitleLabel: PrimaryLabel?
    @IBOutlet weak var retypePasswordTitleLabel: PrimaryLabel?
    
    @IBOutlet weak var usernameHintLabel: SecondaryLabel?
    @IBOutlet weak var passwordHintLabel: SecondaryLabel?
    @IBOutlet weak var retypePasswordHintLabel: SecondaryLabel?
    
    @IBOutlet weak var errorTitleLabel: ErrorLabel?
    @IBOutlet weak var registerButton: PrimaryButton?
    
    @IBOutlet weak var usernameField: TextField?
    @IBOutlet weak var passwordField: TextField?
    @IBOutlet weak var retypePasswordField: TextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
