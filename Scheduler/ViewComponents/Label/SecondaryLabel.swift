//
//  SecondaryLabel.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class SecondaryLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }
    
    func setupAppearance() {
        backgroundColor = Color.primaryBackground
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
        
        font = Font.secondaryText
        textColor = Color.secondaryText
        tintColor = Color.primary
    }
}
