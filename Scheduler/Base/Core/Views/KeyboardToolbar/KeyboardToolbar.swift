//
//  KeyboardToolbar.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/27.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class KeyboardToolbar: UIToolbar {
    
    // MARK: - IBActions

    @IBAction func doneBarButtonItemTapped(_ sender: UIBarButtonItem) {
       UIApplication.shared.sendAction(#selector(resignFirstResponder),
                                       to: nil, from: nil, for: nil)
    }
}
