//
//  XTCollectionViewCell.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/30.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

class XTCollectionViewCell: UICollectionViewCell {
    
    var titleLabel              = UILabel()
    let labelLeadCons           = NSLayoutConstraint()
    var horizonallyCons         = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCell()
    {
        titleLabel = UILabel.init(frame: CGRectMake(0, 0, s_w, 20))
        self.contentView.addSubview(titleLabel)
        
        
    }
}
