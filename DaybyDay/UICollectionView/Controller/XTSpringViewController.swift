//
//  XTSpringViewController.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/30.
//  Copyright © 2016年 夏天. All rights reserved.
//
// 原文: http://www.jianshu.com/p/dfb857763942
import UIKit
let cellId = "cellId"
let topPadding: CGFloat = 20.0
public let BGColor = UIColor(red: 56.0/255.0, green: 51/255.0, blue: 76/255.0, alpha: 1.0)
class XTSpringViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private let colorArray = NSMutableArray()
    private let rowNumber = 15
    private let customTransition = XTEvernoteTransition()
    private let collectionView = UICollectionView(frame: CGRectMake(0, topPadding, s_w, s_h - topPadding), collectionViewLayout: XTCollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BGColor
        collectionView.backgroundColor = BGColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = false
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, verticallyPadding, 0);
        
        self.view.addSubview(collectionView)
        collectionView.registerClass(XTCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        let random = arc4random() % 360 // 160 arc4random() % 360
        for index in 0 ..< rowNumber {
            let color = UIColor(hue: CGFloat((Int(random) + index * 6)) % 360.0 / 360.0, saturation: 0.8, brightness: 1.0, alpha: 1.0)
            colorArray.addObject(color)
        }
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return colorArray.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! XTCollectionViewCell
        cell.backgroundColor = colorArray.objectAtIndex(colorArray.count - 1 - indexPath.section) as? UIColor
        cell.titleLabel.text = "Notebook + " + String(indexPath.section + 1)
//        cell.titleLine.alpha = 0.0
//        cell.textView.alpha = 0.0
//        cell.backButton.alpha = 0.0
        cell.tag = indexPath.section
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! XTCollectionViewCell
        let visibleCells = collectionView.visibleCells() as! [XTCollectionViewCell]
        let viewController = XTNoteViewController()
        viewController.titleName = cell.titleLabel.text!
        viewController.domainColor = cell.backgroundColor!
        
        let finalFrame = CGRectMake(10, collectionView.contentOffset.y, s_w - 20, s_h - 40)
        self.customTransition.EvernoteTransitionWith(selectCell: cell, visibleCells: visibleCells, originFrame: cell.frame, finalFrame: finalFrame, panViewController:viewController, listViewController: self)
        viewController.transitioningDelegate = self.customTransition
        viewController.delegate = self.customTransition
        self.presentViewController(viewController, animated: true) { () -> Void in
        }
    }
}
