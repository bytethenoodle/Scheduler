//
//  TableViewDataSource.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/19.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class TableViewDataSource<V, T> : NSObject, UITableViewDataSource where V: UITableViewCell {
  
  typealias CellConfiguration = (V, T) -> V
  
  private let models: [T]
  private let configureCell: CellConfiguration
  private let cellIdentifier: String
  
  init(cellIdentifier: String, models: [T], configureCell: @escaping CellConfiguration) {
    self.models = models
    self.cellIdentifier = cellIdentifier
    self.configureCell = configureCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(V.self, for: indexPath)
    
    guard let currentCell = cell else {
      fatalError("Identifier or class not registered with this table view")
    }
    
    let model = models[indexPath.row]
    return configureCell(currentCell, model)
  }
}
