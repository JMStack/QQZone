//
//  DockView.swift
//  QQZone
//
//  Created by Jack.Ma on 16/4/29.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

import UIKit

class DockView: UIView, UIViewisPortrait{
    
    private lazy var customTabBar: TabBar = {
       let customTaBar = TabBar()
        self.addSubview(customTaBar)
        return customTaBar
    }()
    
    private lazy var customMenuBar: MenuBar = {
        let customMenuBar = MenuBar()
        self.addSubview(customMenuBar)
        return customMenuBar
    }()
    
    private lazy var customIcon: IconButton = {
       let customIcon = IconButton()
        self.addSubview(customIcon)
        customIcon.setImage(UIImage(named:"icon_image"), forState: .Normal)
        customIcon.setTitle("小黄人", forState: .Normal)
        return customIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = globalBackgroudColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isPortrait() -> Bool {
         return ((superview as? UIViewisPortrait)?.isPortrait())!
    }
}


// MARK: - layoutsubviews
extension DockView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var x, y, w, h:CGFloat
        w = frame.width
        x = 0
        if isPortrait() == true {
            h = 3 * kDockItemHeight
            y = frame.height - h
            customMenuBar.frame = CGRect(x: x, y: y, width: w, height: h)
        } else {
            h = kDockItemHeight
            y = frame.height - h
            customMenuBar.frame = CGRect(x: x, y: y, width: w, height: h)
            
        }
        
        if isPortrait() == true {
            h = 6 * kDockItemHeight
            y = frame.height - customMenuBar.frame.height - h
            customTabBar.frame = CGRect(x: x, y: y, width: w, height: h)
        } else {
            h = 6 * kDockItemHeight
            y = frame.height - customMenuBar.frame.height - h
            customTabBar.frame = CGRect(x: x, y: y, width: w, height: h)
        }
        
        y = kIconButtonY
        if isPortrait() == true {
            w = kIconButtonWH
            x = (frame.width - w) * 0.5
            customIcon.frame = CGRect(x: x, y: y, width: w, height: w)
        } else {
            w = kIconButtonLandscapeWidth
            h = kIconButtonLandscapeHeight
            x = (frame.width - w) * 0.5
            customIcon.frame = CGRect(x: x, y: y, width: w, height: h)
        }
    }
    
}
