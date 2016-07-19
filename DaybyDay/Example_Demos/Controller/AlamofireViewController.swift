//
//  AlamofireViewController.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/29.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit
import Alamofire
import Haneke

let s_w = UIScreen.mainScreen().bounds.width
let s_h = UIScreen.mainScreen().bounds.height

let cellIdentidier = "cellId"
class AlamofireViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerPreviewingDelegate {

    var dataArray = NSArray()
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        // http://api.app.happyjuzi.com/v2.4/article/list/home?&page=1
        let url: String = "http://api.app.happyjuzi.com/v2.4/article/list/home?&page=1"
        self.createSubViews()
        self.XTNetworkReq1(url)
        print("start ---------------")
        

        
    }
    func createSubViews()
    {
        tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.registerClass(AlamofieCustomCell.self, forCellReuseIdentifier: cellIdentidier)
        self.view.addSubview(tableView)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 188
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentidier) as! AlamofieCustomCell
        let model = self.dataArray[indexPath.row] as! AlamofireVCModel
        // 指定代理人
        if #available(iOS 9.0, *) {
            self.registerForPreviewingWithDelegate(self, sourceView: cell)
        } else {
            // Fallback on earlier versions
        }
        cell.alaModel = model
        return cell
    }
    func XTNetworkReq1(url: String){
        print("SUMMER_TEST_1")
        Alamofire.request(.GET, url, parameters: nil)
            .validate(contentType: ["application/json", "text/json", "text/javascript", "text/html","text/css", "text/plain","application/x-javascript"])
            .responseJSON { response in
                
                switch response.result {
                case .Success:
                // print("Validation Successful: \(response.result.value)")
                // json 转化成字典
                let jsonDataDic = response.result.value as? NSDictionary
                let dataDic = jsonDataDic?.objectForKey("data")
                let listArray = dataDic?.objectForKey("list")
                print(listArray)
                self.dataArray = AlamofireVCModel.mj_objectArrayWithKeyValuesArray(listArray)
                if self.dataArray.count > 0
                {
                    // 进行UI操作
                    self.tableView.reloadData()
                }
                case .Failure(let error):
                    print(error)
                }
        }
    }
    /// MARK: - peek的代理方法, 长按触发弹出预览VC
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let preVC = PreviewViewController()
        if #available(iOS 9.0, *) {
            let indexPath = self.tableView.indexPathForCell((previewingContext.sourceView) as! AlamofieCustomCell)! as NSIndexPath
            preVC.preViewModel = self.dataArray[indexPath.row] as! AlamofireVCModel
        } else {
            // Fallback on earlier versions
        }
        return preVC
    }
    /// MARK: - pop的代理方法，在此处可对将要进入的vc进行处理
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        // code
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

    /**
     *  
     func XTNetworkReq(url: String){
     Alamofire.request(.GET, url).responseJSON { response in
     //
     print("request: \(response.request)") // URL: http://api.app.happyjuzi.com/v2.4/article/list/home?&page=1
     /**
     URL: http://api.app.happyjuzi.com/v2.4/article/list/home?&page=1 } { status code: 200, headers {
     "Accept-Ranges" = bytes;
     Age = 0;
     "Cache-Control" = "no-cache, must-revalidate";
     Connection = "keep-alive";
     "Content-Encoding" = gzip;
     "Content-Length" = 4368;
     "Content-Type" = "application/json";
     Date = "Wed, 29 Jun 2016 03:25:49 GMT";
     KeepAlive = off;
     "Last-Modified" = "Wed, 29 Jun 2016 03:25:44 GMT";
     Server = "openresty/1.7.10.1";
     Via = "1.1 varnish";
     "X-Cache" = "juzi MISS";
     "X-Varnish" = 1795315599;
     */
     print("response: \(response.response)")
     // data
     print("data: \(response.data)")
     // SUCCESS
     print("result: \(response.result)")
     // JSON
     if let JSON = response.result.value{
     print("JSON: \(JSON)")
     }
     }
     
     }

     */
    /**
     *
     // 网络监听
     let manager = NetworkReachabilityManager(host: "www.baidu.com")
     
     manager?.listener = { status in
     print("Network Status Changed: ------------- \(status)")
     switch status {
     
     case .Reachable: break
     //
     case .Unknown: break
     //
     case .NotReachable: break
     //
     }
     }
     
     manager?.startListening()
     */
}
