//
//  CalendarCollectionViewCell.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: PrimaryLabel?
    @IBOutlet weak var indicatorView: UIView?
    
    func hasDate() {
        indicatorView?.backgroundColor = Color.primary
    }
    
    func hasNoDate() {
        indicatorView?.backgroundColor = Color.primaryBackground
    }
}
