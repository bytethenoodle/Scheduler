//
//  Color.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class Color {
    
    static var primary: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "Primary")
        }
        else {
            return UIColor(rgbRed: 51, rgbGreen: 51, rgbBlue: 51, alpha: 1.0)
        }
    }
    
    static var primaryText: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "PrimaryText")
        }
        else {
            return UIColor(rgbRed: 51, rgbGreen: 51, rgbBlue: 51, alpha: 1.0)
        }
    }
    
    static var primaryBackground: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "PrimaryBackground")
        } else {
            return UIColor(rgbRed: 220, rgbGreen: 220, rgbBlue: 220, alpha: 1.0)
        }
    }
}
