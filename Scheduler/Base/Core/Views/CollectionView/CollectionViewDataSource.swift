//
//  CollectionViewDataSource.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

final class CollectionViewDataSource<V, T> : NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
  
    typealias CellConfiguration = (V, T?) -> V
  
    var models: [T] = []
    
    private let configureCell: CellConfiguration
  
    init(configureCell: @escaping CellConfiguration) {
        self.configureCell = configureCell
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(V.self, for: indexPath)
        let model = models[safeIndex: indexPath.row]
        return configureCell(cell, model)
    }
}
