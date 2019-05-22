//
//  ReverseLayout.swift
//  3x3ConnectAssignment
//
//  Created by Saikat on 21/05/19.
//  Copyright © 2019 Saikat. All rights reserved.
//

import UIKit

class ReverseLayout: UICollectionViewLayout {
    
    
    fileprivate var cellPadding: CGFloat = 6
  
    fileprivate let cellHeight: CGFloat = 250 // Your cell height here...
    
    override func prepare() {
        super.prepare()
        //For optimization we can use cache also if the layout is more complex
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttrs = [UICollectionViewLayoutAttributes]()
        
        if let collectionView = self.collectionView {
            for section in 0 ..< collectionView.numberOfSections {
                if let numberOfSectionItems = numberOfItemsInSection(section) {
                    for item in 0 ..< numberOfSectionItems {
                        let indexPath = IndexPath(item: item, section: section)
                        let layoutAttr = layoutAttributesForItem(at: indexPath)
                        
                        if let layoutAttr = layoutAttr, layoutAttr.frame.intersects(rect) {
                            layoutAttrs.append(layoutAttr)
                        }
                    }
                }
            }
        }
        
        return layoutAttrs
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let layoutAttr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let contentSize = self.collectionViewContentSize
        
        layoutAttr.frame = CGRect(
            x: 0, y: contentSize.height - CGFloat(indexPath.item + 1) * cellHeight,
            width: contentSize.width, height: cellHeight - cellPadding*2)
        
        return layoutAttr
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int? {
        if let collectionView = self.collectionView,
            let numSectionItems = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: section)
        {
            return numSectionItems
        }
        
        return 0
    }
    
    override var collectionViewContentSize: CGSize {
        get {
            var height: CGFloat = 0.0
            var bounds = CGRect.zero
            
            if let collectionView = self.collectionView {
                for section in 0 ..< collectionView.numberOfSections {
                    if let numItems = numberOfItemsInSection(section) {
                        height += (CGFloat(numItems) * cellHeight + cellPadding * 2)
                    }
                }
                
                bounds = collectionView.bounds
            }
            
            return CGSize(width: bounds.width - (collectionView!.contentInset.right + collectionView!.contentInset.left), height: max(height, bounds.height) - (collectionView!.contentInset.top + collectionView!.contentInset.bottom) + cellPadding*2)
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        if let oldBounds = self.collectionView?.bounds,
            oldBounds.width != newBounds.width || oldBounds.height != newBounds.height
        {
            return true
        }
        
        return false
        
    }
    

}

protocol CustomUICollectionViewLayoutDelegate: class {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
    
}
