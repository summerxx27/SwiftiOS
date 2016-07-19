//
//  AlamofieCustomCell.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/29.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

class AlamofieCustomCell: UITableViewCell {
    var alaModel = AlamofireVCModel()
    var imagePic = UIImageView()
    var labelTitle = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        self.createCellSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCellSubviews(){
        imagePic = UIImageView.init(frame: CGRectMake(5, 5, s_w - 10, 188 - 10))
        self.contentView.addSubview(imagePic)
        
        labelTitle = UILabel.init(frame: CGRectMake(10, 10, s_w, 60))
        labelTitle.numberOfLines = 0
        labelTitle.textColor = UIColor ( red: 1.0, green: 0.4666, blue: 0.3002, alpha: 1.0 )
        imagePic.addSubview(labelTitle)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if (self.alaModel.pic != nil && self.alaModel.pic?.hasSuffix("gif") != nil){
            self.imagePic.hnk_setImageFromURL(NSURL.init(string: (self.alaModel.pic?.substringToIndex((self.alaModel.pic?.startIndex.advancedBy(66))!))!)!)
        }
        self.labelTitle.text = self.alaModel.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
