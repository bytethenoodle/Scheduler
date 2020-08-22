//
//  UITableView.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<Cell: UITableViewCell>(_ cellType: Cell.Type) {
        let nibName = String(describing: cellType)
        if Bundle.main.path(forResource: nibName, ofType: "nib") != nil {
            register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
        } else {
            register(cellType, forCellReuseIdentifier: nibName)
        }
    }

    func dequeueReusableCell<Cell: UITableViewCell>(_ cellType: Cell.Type,
                                                    for indexPath: IndexPath) -> Cell? {
        return dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? Cell
    }

    func dequeueReusableCell<Cell: UITableViewCell>(with cellType: Cell.Type) -> Cell? {
        return dequeueReusableCell(withIdentifier: String(describing: cellType)) as? Cell
    }

}
