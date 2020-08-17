//
//  PrimaryButton.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }
    
    func setupAppearance() {
        backgroundColor = Color.primary
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = 16.0
        
        titleLabel?.font = Font.buttonTitle
        setTitleColor(Color.primaryBackground, for: UIControl.State())
        tintColor = Color.primary
    }
}
