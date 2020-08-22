//
//  Storyboardable.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/16.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

protocol Storyboardable where Self: UIViewController {
    
    static var instantiableStoryboard: UIStoryboard { get }
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
}

extension Storyboardable {

    static var instantiableStoryboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }

    static var storyboardName: String {
        return String(describing: Self.self)
    }

    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }

    static func instantiateFromStoryboard() -> Self? {
        return instantiableStoryboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self
    }
}
