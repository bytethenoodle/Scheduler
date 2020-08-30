//
//  CollectionViewColumnFlowLayout.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 8/19/20.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

class CollectionViewColumnFlowLayout: UICollectionViewFlowLayout {

    private var cellsPerRow: Int = 0

    init(cellsPerRow: Int = 0,
         minimumInteritemSpacing: CGFloat = 0,
         minimumLineSpacing: CGFloat = 0,
         sectionInset: UIEdgeInsets = .zero) {
        super.init()
        
        self.cellsPerRow = cellsPerRow
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }
        
        // Compute for left and right safe area insets based on iOS version
        var leftInset: CGFloat = 0.0
        var rightInset: CGFloat = 0.0
        if #available(iOS 11.0, *) {
            leftInset = collectionView.safeAreaInsets.left
            rightInset = collectionView.safeAreaInsets.right
        }
        
        // Compute for margins and insets and apply them in computing the size of the collection items
        let marginsAndInsets = sectionInset.left + sectionInset.right +
                               leftInset + rightInset + minimumInteritemSpacing *
                               CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) /
                         CGFloat(cellsPerRow)).rounded(.down)
        
        // Apply the computed item collection item size
        itemSize = CGSize(width: itemWidth, height: itemWidth)
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds)
        
        (context as? UICollectionViewFlowLayoutInvalidationContext)?.invalidateFlowLayoutDelegateMetrics =
            (newBounds.size != collectionView?.bounds.size)
        
        return context
    }

}
