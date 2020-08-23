//
//  RegistrationViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class RegistrationViewController: KeyboardObservableViewController<RegistrationCoordinator, RegistrationState>, Storyboardable, UITextFieldDelegate {
    
    // MARK: - Outlets
    
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

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    // MARK: - Actions
    
    @IBAction func didTapRegisterButton(_ sender: Any?) {
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil);
        viewCoordinator?.store?.dispatch(RegistrationAction(username: usernameField?.text ?? String.empty,
                                                            password: passwordField?.text ?? String.empty,
                                                            retypePassword: retypePasswordField?.text ?? String.empty))
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameField:
            passwordField?.becomeFirstResponder()
            break
        case passwordField:
            retypePasswordField?.becomeFirstResponder()
            break
        case retypePasswordField:
            didTapRegisterButton(textField)
            break
        default:
            break
        }
        return true
    }
}
