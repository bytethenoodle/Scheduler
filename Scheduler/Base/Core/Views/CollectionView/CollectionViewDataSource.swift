//
//  CollectionViewDataSource.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class CollectionViewDataSource<V, T> : NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
  
    typealias CellConfiguration = (V, T) -> V 
  
    private let models: [T]
    private let configureCell: CellConfiguration
  
    init(models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.configureCell = configureCell
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(V.self, for: indexPath)
        
        guard let currentCell = cell else {
          fatalError("Identifier or class not registered with this collection view")
        }
        
        let model = models[indexPath.row]
        return configureCell(currentCell, model)
    }
}
