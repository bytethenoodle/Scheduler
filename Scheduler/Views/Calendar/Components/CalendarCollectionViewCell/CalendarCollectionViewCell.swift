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
    @IBOutlet weak var indicatorStackView: UIStackView?
    @IBOutlet weak var indicatorView: UIView?

    func setup(date: Date?) {
                
        dateLabel?.text = date?.dayString()
        dateLabel?.isError = date?.dateString() == Date().dateString()
        hasNoDate()
        
        guard let date = date else {return}
        
        if !EventRepository.getEvents(date: date).isEmpty {
            hasDate()
        }
    }
    
    private func hasDate() {
        indicatorStackView?.isHidden = false
        indicatorView?.backgroundColor = Color.primary
    }
    
    private func hasNoDate() {
        indicatorStackView?.isHidden = true
        indicatorView?.backgroundColor = Color.primaryBackground
    }
}
