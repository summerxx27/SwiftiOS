//
//  NoteViewController.swift
//  DaybyDay
//
//  Created by zjwang on 16/6/30.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

public protocol NoteViewControllerDelegate:NSObjectProtocol {
    func didClickGoBack()
}

class XTNoteViewController: UIViewController {
    internal weak var delegate: NoteViewControllerDelegate?
    internal var domainColor:UIColor = UIColor()
    internal var titleName:String?
    var totalView   = UIView()
    var textView    = UITextView()
    var titleLabel  = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.hidden = true
        
        totalView = UIView.init(frame: CGRectMake(10, 20, s_w - 20, s_h - 40))
        self.view.addSubview(totalView)
        totalView.layer.masksToBounds = true
        totalView.layer.cornerRadius = 5.0
        totalView.backgroundColor = domainColor
        titleLabel.text = titleName
        textView.contentOffset = CGPointMake(0, 0)
        let tap = UITapGestureRecognizer(target: self, action: #selector(XTNoteViewController.handleTapGesture(_:)))
        self.totalView.addGestureRecognizer(tap)
        
        let btn = UIButton.init(type: UIButtonType.Custom)
        btn.frame = CGRectMake(5, 5, 40, 40)
        btn.backgroundColor = UIColor.whiteColor()
        totalView.addSubview(btn)
        btn.addTarget(self, action: #selector(XTNoteViewController.goBack), forControlEvents: UIControlEvents.TouchUpInside)
        
//        
//        titleLabel = UILabel.init(frame: CGRectMake(50, 5, s_w - 50, 40))
//        totalView.addSubview(titleLabel)
//        titleLabel.text = titleName
        
        textView = UITextView.init(frame: CGRectMake(5, 55, s_w - 10, s_h - 55))
//        totalView.addSubview(textView)
        textView.backgroundColor = UIColor.clearColor()
        textView.text = "hello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nannhello world collection my nann"
        
        
    }
    
    func handleTapGesture(gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    func goBack(sender: AnyObject)
    {
        delegate?.didClickGoBack()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
