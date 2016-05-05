//
//  TabBar.swift
//  QQZone
//
//  Created by Jack.Ma on 16/4/30.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

import UIKit

class TabBar: UIView, UIViewisPortrait {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = globalBackgroudColor
        addOneTabBarButtonWithImage(UIImage(named: "tab_bar_feed_icon"), title: "全部动态")
        addOneTabBarButtonWithImage(UIImage(named: "tab_bar_passive_feed_icon"), title: "与我相关")
        addOneTabBarButtonWithImage(UIImage(named: "tab_bar_pic_wall_icon"), title: "照片墙")
        addOneTabBarButtonWithImage(UIImage(named: "tab_bar_e_album_icon"), title: "电子相框")
        addOneTabBarButtonWithImage(UIImage(named: "tab_bar_friend_icon"), title: "好友")
        addOneTabBarButtonWithImage(UIImage(named: "tab_bar_e_more_icon"), title: "其它")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isPortrait() -> Bool {
        return ((superview as? UIViewisPortrait)?.isPortrait())!
    }
    
    private func addOneTabBarButtonWithImage(image: UIImage?, title: String) {
        guard let image = image else {
            return
        }
        
        let button = TabBarButton(type: .Custom)
        button.setImage(image, forState: .Normal)
        button.setTitle(title, forState: .Normal)
        addSubview(button)
    }
}

// MARK: - layout subviews
extension TabBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        var x,y,w,h: CGFloat
        
        w = frame.width
        h = kDockItemHeight
        x = 0
        for (index, view) in subviews.enumerate() {
            y = CGFloat(index) * h
            view.frame = CGRect(x: x, y: y, width: w, height: h)
        }
    }
}

