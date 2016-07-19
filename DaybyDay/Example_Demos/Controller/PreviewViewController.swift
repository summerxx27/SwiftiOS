//
//  PreviewViewController.swift
//  DaybyDay
//
//  Created by zjwang on 16/7/19.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    var preViewModel = AlamofireVCModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preViewCell()
        
    }
    func preViewCell()
    {
        let imagePic = UIImageView.init(frame: CGRectMake(5, 5, s_w - 10, 288 - 10))
        self.view.addSubview(imagePic)
        let labelTitle = UILabel.init(frame: CGRectMake(5, 288, s_w, 60))
        labelTitle.numberOfLines = 0
        labelTitle.textColor = UIColor ( red: 1.0, green: 0.4666, blue: 0.3002, alpha: 1.0 )
        self.view.addSubview(labelTitle)
        
        if (self.preViewModel.pic != nil && self.preViewModel.pic?.hasSuffix("gif") != nil){
            imagePic.hnk_setImageFromURL(NSURL.init(string: (self.preViewModel.pic?.substringToIndex((self.preViewModel.pic?.startIndex.advancedBy(66))!))!)!)
        }
        labelTitle.text = self.preViewModel.title
    }
    
    @available(iOS 9.0, *)
    override func previewActionItems() -> [UIPreviewActionItem] {
        var items = [UIPreviewAction]()
        let action1 = UIPreviewAction.init(title: "收藏", style: UIPreviewActionStyle.Default, handler: { (action: UIPreviewAction, previewViewController: UIViewController) in
                print("收藏")
            })
            
        let action2 = UIPreviewAction.init(title: "喜欢", style: UIPreviewActionStyle.Default, handler: { (action: UIPreviewAction, previewViewController: UIViewController) in
                print("喜欢")
            })    
        items.append(action1)
        items.append(action2)
        return items;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
