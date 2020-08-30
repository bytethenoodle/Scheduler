//
//  TableViewDataSource.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class TableViewDataSource<V, T> : NSObject, UITableViewDataSource where V: UITableViewCell {
  
    typealias CellConfiguration = (V, T?) -> V
  
    var models: [T] = []
    
    private let configureCell: CellConfiguration
  
    init(configureCell: @escaping CellConfiguration) {
        self.configureCell = configureCell
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(V.self, for: indexPath)
        let model = models[safeIndex: indexPath.row]
        return configureCell(cell, model)
    }
}
