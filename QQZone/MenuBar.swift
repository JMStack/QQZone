//
//  MenuBar.swift
//  QQZone
//
//  Created by Jack.Ma on 16/4/29.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

import UIKit

class MenuBar: UIView, UIViewisPortrait {
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = globalBackgroudColor
        addOneButtonWithImage(UIImage(named:"tabbar_mood"))
        addOneButtonWithImage(UIImage(named: "tabbar_photo"))
        addOneButtonWithImage(UIImage(named: "tabbar_blog"))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isPortrait() -> Bool {
        return ((superview as? UIViewisPortrait)?.isPortrait())!
    }
    
   private func addOneButtonWithImage(image: UIImage?) {
        let button = UIButton(type: .Custom)
        button.setImage(image!, forState: .Normal)
        addSubview(button)
    }
    
}

// MARK: - loyout subviews
extension MenuBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard subviews.count > 0 else {
            return
        }
        
        var x, y, w, h:CGFloat
        for (index, view) in subviews.enumerate() {
            if isPortrait() == true {
                w = frame.width
                h = kDockItemHeight
                x = 0
                y = CGFloat(index) * h
                view.frame = CGRect(x: x, y: y, width: w, height: h)
            } else {
                w = frame.width / CGFloat(subviews.count)
                h = kDockItemHeight
                x = CGFloat(index) * w
                y = frame.height - h
                view.frame = CGRect(x: x, y: y, width: w, height: h)
            }
        }

    }
    
}
