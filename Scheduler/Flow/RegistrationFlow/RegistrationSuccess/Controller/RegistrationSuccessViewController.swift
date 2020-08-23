//
//  RegistrationSuccessViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class RegistrationSuccessViewController: ViewController<RegistrationSuccessCoordinator,
                                                        RegistrationSuccessState>,
                                         Storyboardable {

    // MARK: - Outlets
    
    @IBOutlet weak var successLabel: PrimaryLabel?
    @IBOutlet weak var returnButton: PrimaryButton?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        restoreNavigation()
    }
    
    // MARK: - View Setups
    
    private func setupNavigation() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: String.empty,
                                                           style: .plain,
                                                           target: nil, action: nil)

    }
    
    private func restoreNavigation() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    // MARK: - Actions
    
    @IBAction func didTapReturnToLoginButton(_ sender: Any?) {
        viewCoordinator?.store?.dispatch(RegistrationSuccessReturnAction())
    }
}
