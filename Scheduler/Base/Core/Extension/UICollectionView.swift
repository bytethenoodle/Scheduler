//
//  UICollectiobView.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

extension UICollectionView {

    func register<Cell: UICollectionViewCell>(_ cellType: Cell.Type) {
        let nib = UINib(nibName: String(describing: cellType), bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: String(describing: cellType))
    }

    func dequeueReusableCell<Cell: UICollectionViewCell>(_ cellType: Cell.Type, for indexPath: IndexPath) -> Cell? {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? Cell
    }

}
