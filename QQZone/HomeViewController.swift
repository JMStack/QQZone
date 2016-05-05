//
//  HomeViewController.swift
//  QQZone
//
//  Created by Jack.Ma on 16/4/29.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

import UIKit

// MARK: - controller view  life circle
class HomeViewController: BasicViewController {
    
    var contentView: UIView {
        get { // 子控制器的view添加到contentView上,不需要考虑横竖屏的适配
            return (view as! HomePageView).contentView
        }
    }
    
    override func loadView() {
        view = HomePageView()
        view.backgroundColor = globalBackgroudColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add your code ...
    }
}
