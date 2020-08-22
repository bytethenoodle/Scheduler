//
//  EventsTableViewCell.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    func setup(event: Event) {
        textLabel?.text = event.title
        textLabel?.textColor = Color.primaryText
    }
}
