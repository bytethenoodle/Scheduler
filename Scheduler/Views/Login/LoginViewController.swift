//
//  LoginViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class LoginViewController: KeyboardObservableViewController<LoginCoordinator, LoginState>, Storyboardable, UITextFieldDelegate {
        
    // MARK: - Properties
    
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
    
    // MARK: - Actions
    
    @IBAction func didTapSubmitButton(_ sender: Any?) {
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil);
        viewCoordinator?.store?.dispatch(LoginAction(username: usernameField?.text ?? String.empty,
                                                     password: passwordField?.text ?? String.empty))
    }
    
    @IBAction func didTapRegisterButton(_ sender: Any?) {
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil);
        viewCoordinator?.store?.dispatch(LoginRegisterAction())
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameField:
            passwordField?.becomeFirstResponder()
            break
        case passwordField:
            didTapSubmitButton(textField)
            break
        default:
            break
        }
        return true
    }
}
