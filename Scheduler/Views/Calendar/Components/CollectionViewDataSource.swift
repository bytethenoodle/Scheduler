//
//  CollectionViewDataSource.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class CollectionViewDataSource<V, T> : NSObject, UICollectionViewDataSource where V: CalendarCollectionViewCell {
  
    typealias CellConfiguration = (V, T) -> V 
  
    private let models: [T]
    private let configureCell: CellConfiguration
    private let cellIdentifier: String
  
    init(cellIdentifier: String, models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.cellIdentifier = cellIdentifier
        self.configureCell = configureCell
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? V
        
        guard let currentCell = cell else {
          fatalError("Identifier or class not registered with this collection view")
        }
        
        let model = models[indexPath.row]
        return configureCell(currentCell, model)
    }
}
