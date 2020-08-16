//
//  Font.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class Font {
    static var primaryText: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    }
    
    static var secondaryText: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    static var fieldText: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    }
    
    static var errorText: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    static var buttonTitle: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    }
    
    static var navigationTitle: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
}
