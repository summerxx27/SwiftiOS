//
//  XTHomeViewController.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/28.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

class XTHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ZJCycleViewDelegate {

    // init
    var tableView = UITableView()
    // dataSource
    var dataArrayClass = [UIViewController]()
    //
    var dataArrayTitles = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
        
        
        self.title = "首页"
        tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view .addSubview(tableView)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        // data
        self .addCell(XTCollectionViewController(), title: "CollectionView - Example")
        self .addCell(AlamofireViewController(), title: "Alamofire - Example")
        
        tableView.reloadData()
        //
        self.createHeaderView()
    }
    func createHeaderView()
    {
        let viewHeader = UIView.init(frame: CGRectMake(0, 0, width, 180))
        // 轮播图
        let cycle = ZJCycleScrollView.init(frame: CGRectMake(0, 0, width, 180))
        cycle.delegate = self;
        viewHeader.addSubview(cycle)
        let images: NSMutableArray = [
            "http://ww4.sinaimg.cn/large/e6a4355cgw1f567amxuznj206z0d0q3l.jpg",
            "http://ww4.sinaimg.cn/large/e6a4355cgw1f567b1n5s7j206v0cuq3i.jpg",
            "http://ww3.sinaimg.cn/large/e6a4355cgw1f567bolsqqj206s0d2752.jpg",
            "http://ww2.sinaimg.cn/large/e6a4355cgw1f567c1bpjkj206y0d0q3r.jpg",
            "http://ww2.sinaimg.cn/large/e6a4355cgw1f567cekbk0j206z0cz0tl.jpg"]
        cycle.images = images
        
        tableView.tableHeaderView = viewHeader
    }
    func addCell(vc: UIViewController, title: String){
        self.dataArrayClass.append(vc)
        self.dataArrayTitles.append(title)
        
        print("mark -----")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArrayTitles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier")
        cell?.textLabel?.text = self.dataArrayTitles[indexPath.row]
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44;
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
                self.navigationController?.pushViewController(self.dataArrayClass[0], animated: true)
        case 1:
                self.navigationController?.pushViewController(self.dataArrayClass[1], animated: true)
        default:
            break
        }
    }
    /// MARK: - didSelect
    func didSelectIndexCollectionViewCell(index: Int) {
        print("点击轮播图片显示Charts Demo")
        self.navigationController?.pushViewController(ChartsViewController(), animated: true)
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
