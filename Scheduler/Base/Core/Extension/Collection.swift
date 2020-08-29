//
//  Collection.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/28.
//  Copyright © 2020 mynt. All rights reserved.
//

import Foundation

extension Collection {
    subscript (safeIndex index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
