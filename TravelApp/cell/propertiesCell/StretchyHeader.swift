//
//  StretchyHeader.swift
//  TravelApp
//
//  Created by Toan on 7/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class StretchyHeader: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttribute = super.layoutAttributesForElements(in: rect)
        layoutAttribute?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
            
                guard  let colectionview = collectionView else {
                    return
                }
                let contenOfsetY = colectionview.contentOffset.y
                let width = colectionview.frame.width
                let height  =  attributes.frame.height - contenOfsetY
                attributes.frame = CGRect(x: 0, y: contenOfsetY, width: width , height: height)
            }
        })
        return layoutAttribute
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
