//
//  XTCollectionViewController.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/28.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

class XTCollectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView = UITableView()
    var array = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
        self.array = ["弹簧效果", "自由移动Cell", "瀑布流", "其他..."]
        tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.rowHeight = 50
        self.view.addSubview(tableView)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier")
        cell?.textLabel?.text = self.array[indexPath.row]
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        switch index {
        case 0:
            let vc = XTSpringViewController()
            self .presentViewController(vc, animated: true, completion: { 
                // 
            })
        default:
            break
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
