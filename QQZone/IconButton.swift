//
//  IconButton.swift
//  QQZone
//
//  Created by Jack.Ma on 16/5/5.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

import UIKit

class IconButton: UIButton, UIViewisPortrait {
    func isPortrait() -> Bool {
        guard let superview = superview else {
            return true
        }
        return ((superview as? UIViewisPortrait)?.isPortrait())!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel?.textAlignment = .Center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        if isPortrait() == true {
            return super.imageRectForContentRect(contentRect)
        } else {
            let x: CGFloat = 0
            let y: CGFloat = 0
            let w: CGFloat = frame.width
            let h: CGFloat = frame.height * 0.7
            return CGRectMake(x, y, w, h)
        }
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        if isPortrait() == true {
            return CGRectZero
        } else {
            let x: CGFloat = 0
            let y: CGFloat = frame.height * 0.7
            let w: CGFloat = frame.width
            let h: CGFloat = frame.height - y
            return CGRectMake(x, y, w, h)
        }
    }
    
}
