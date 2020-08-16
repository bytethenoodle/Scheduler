//
//  SecondaryButton.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class SecondaryButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }
    
    func setupAppearance() {
        backgroundColor = Color.primaryBackground
        layer.borderWidth = 1
        layer.borderColor = Color.primary?.cgColor
        layer.cornerRadius = 16.0
        
        titleLabel?.font = Font.buttonTitle
        setTitleColor(Color.primary, for: UIControl.State())
        tintColor = Color.primary
    }
}
