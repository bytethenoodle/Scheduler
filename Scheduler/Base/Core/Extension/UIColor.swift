//
//  UIColor.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

extension UIColor {

   convenience init(rgbRed: Int, rgbGreen: Int, rgbBlue: Int, alpha: CGFloat) {

     let red: CGFloat = CGFloat(rgbRed) / 255
     let green: CGFloat = CGFloat(rgbGreen) / 255
     let blue: CGFloat = CGFloat(rgbBlue) / 255

     self.init(red: red, green: green, blue: blue, alpha: alpha)
   }
}
