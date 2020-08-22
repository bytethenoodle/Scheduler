//
//  UIView.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/22.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

extension UIView {
    static func instantiateFromNib() -> Self? {
        return Bundle(for: Self.self).loadNibNamed(String(describing: Self.self),
                                                   owner: nil,
                                                   options: nil)?.first as? Self
    }
}
