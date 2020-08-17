//
//  String.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import Foundation

extension String {
    
    static let empty: String = ""
    
    func isEmpty() -> Bool {
        return self == String.empty
    }
}
