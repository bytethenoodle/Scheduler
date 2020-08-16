//
//  LoginViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/13.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class LoginViewController: KeyboardObservableViewController, ViewControllerCoordinatable, Storyboardable {
    
    typealias CoordinatorType = LoginCoordinator

    var viewCoordinator: LoginCoordinator?
    
    @IBOutlet weak var scrollView: UIScrollView?
    
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
        subscribeStore()
    }
    
    deinit {
        unsubscribeStore()
    }
    
    func subscribeStore() {
        guard let viewCoordinator = viewCoordinator else {return}
        viewCoordinator.store.subscribe(viewCoordinator) { $0.select { $0 }}
    }
    
    func unsubscribeStore() {
        guard let viewCoordinator = viewCoordinator else {return}
        viewCoordinator.store.unsubscribe(viewCoordinator)
    }
    
    override func keyboardHeightChanged(keyboardHeight: CGFloat) {
        super.keyboardHeightChanged(keyboardHeight: keyboardHeight)
        
        print("---> \(keyboardHeight)")
    }
}
