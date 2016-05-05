//
//  HomePageView.swift
//  QQZone
//
//  Created by Jack.Ma on 16/4/29.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

import UIKit

protocol UIViewisPortrait: NSObjectProtocol {
    func isPortrait() -> Bool
}

class HomePageView: UIView, UIViewisPortrait {
    private lazy var dockView:DockView = DockView()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = UIColor.whiteColor()
        // 作为容器View,子控制器的view将添加到容器view上
        self.addSubview(contentView)
        return contentView
    }()
    
    func isPortrait() -> Bool {
        return frame.width < frame.height
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dockView)
        dockView.backgroundColor = globalBackgroudColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dockView.frame.size.height = frame.height
        dockView.frame.size.width = isPortrait() ? kDockProtraitWidth : kDockLandscapeWidth
        
        let x: CGFloat = dockView.frame.width
        let y: CGFloat = 20
        // 无论横竖屏,内容视图的宽都一样
        let w: CGFloat = min(frame.width, frame.height) - kDockProtraitWidth
        let h: CGFloat = frame.height - y
        
        contentView.frame = CGRectMake(x, y, w, h)
    }
    
}
