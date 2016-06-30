//
//  XTCollectionViewFlowLayout.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/30.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

public let horizonallyPadding: CGFloat = 10.0
public let verticallyPadding: CGFloat = 10.0
public let cellWidth = s_w - 2 * horizonallyPadding
private let cellHeight: CGFloat = 45.0
private let SpringFactor: CGFloat = 10.0

class XTCollectionViewFlowLayout: UICollectionViewFlowLayout {

    
    override init() {
        super.init()
        itemSize = CGSizeMake(cellWidth, cellHeight)
        headerReferenceSize = CGSizeMake(s_w, verticallyPadding)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        itemSize = CGSizeMake(cellWidth, cellHeight)
        headerReferenceSize = CGSizeMake(s_w, verticallyPadding)
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    // MARK: - 这个动画只在collectionview滑动到顶部和底部会触发，重写layoutAttributesForElementsInRect这个方法根据collectionview的contentoffset计算出cell的frame
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let offsetY = self.collectionView!.contentOffset.y
        let attrsArray = super.layoutAttributesForElementsInRect(rect)
        let collectionViewFrameHeight = self.collectionView!.frame.size.height;
        let collectionViewContentHeight = self.collectionView!.contentSize.height;
        let ScrollViewContentInsetBottom = self.collectionView!.contentInset.bottom;
        let bottomOffset = offsetY + collectionViewFrameHeight - collectionViewContentHeight - ScrollViewContentInsetBottom
        let numOfItems = self.collectionView!.numberOfSections()
        
        for attr:UICollectionViewLayoutAttributes in attrsArray! {
            if (attr.representedElementCategory == UICollectionElementCategory.Cell) {
                var cellRect = attr.frame;
                if offsetY <= 0 {
                    let distance = fabs(offsetY) / SpringFactor;
                    cellRect.origin.y += offsetY + distance * CGFloat(attr.indexPath.section + 1);
                }else if bottomOffset > 0 {
                    let distance = bottomOffset / SpringFactor;
                    cellRect.origin.y += bottomOffset - distance *
                        CGFloat(numOfItems - attr.indexPath.section)
                }
                attr.frame = cellRect;
            }
        }
        return attrsArray;
    }
}
