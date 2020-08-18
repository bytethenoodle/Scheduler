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

    @IBOutlet weak var successLabel: PrimaryLabel?
    @IBOutlet weak var returnButton: PrimaryButton?
    
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
