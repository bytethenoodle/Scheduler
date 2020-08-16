//
//  TextField.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }
    
    func setupAppearance() {
        borderStyle = .none
        backgroundColor = Color.primaryBackground
        layer.borderWidth = 1
        layer.borderColor = Color.primary?.cgColor
        layer.cornerRadius = 16.0
        
        font = Font.fieldText
        textColor = Color.primaryText
        tintColor = Color.primary
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16.0 , dy: 0.0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16.0 , dy: 0.0)
    }
}
