//
//  ChartsViewController.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/28.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit
import SnapKit
class ChartsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        // https://github.com/Zhangjingwang1993/Charts_Swift.git
        //
        let addressText = UITextView()
        view.addSubview(addressText)
        addressText.text = "https://github.com/Zhangjingwang1993/Charts_Swift.git"
        addressText.textColor = UIColor ( red: 0.1623, green: 0.4648, blue: 1.0, alpha: 1.0 )
        // 在不设置字体的时候
        addressText.font = UIFont.systemFontOfSize(24)
        
        addressText.snp.makeConstraints { (make) in
            //
            make.top.equalTo(-5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)
        }
        
        
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
