//
//  SecondaryLabel.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class SecondaryLabel: UILabel {
    
    var isError: Bool = false {
        didSet {
            isError ? errorAppearance() : normalAppearance()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        normalAppearance()
    }
    
    func setupAppearance() {
        backgroundColor = Color.primaryBackground
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
        
        font = Font.secondaryText
        tintColor = Color.primary
    }
    
    private func normalAppearance() {
        setupAppearance()
        textColor = Color.secondaryText
    }
    
    private func errorAppearance() {
        setupAppearance()
        textColor = Color.errorText
    }
}
