//
//  TextField.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    // MARK: - Computed Properties
    
    var isError: Bool = false {
        didSet {
            isError ? errorAppearance() : normalAppearance()
        }
    }
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        normalAppearance()
        setupToolbar()
    }
    
    // MARK: - Setups
    
    func setupAppearance() {
        borderStyle = .none
        
        layer.borderColor = Color.primary?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 16.0
        
        textColor = Color.primaryText
        font = Font.fieldText
        tintColor = Color.primary
    }
    
    private func normalAppearance() {
        setupAppearance()
        backgroundColor = Color.primaryBackground
    }
    
    private func errorAppearance() {
        setupAppearance()
        backgroundColor = Color.errorBackground
    }
    
    func setupToolbar() {
        inputAccessoryView = KeyboardToolbar.instantiateFromNib()
    }
    
    // MARK: - Text Editing
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16.0 , dy: 0.0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16.0 , dy: 0.0)
    }
}
