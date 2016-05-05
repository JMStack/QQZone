//
//  TabBarButton.swift
//  QQZone
//
//  Created by Jack.Ma on 16/4/30.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

import UIKit

class TabBarButton: UIButton, UIViewisPortrait {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .Left
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func isPortrait() -> Bool {
        guard let superview = superview else {
            return true
        }
        return ((superview as? UIViewisPortrait)?.isPortrait())!
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        guard let image = currentImage else {
            return CGRectZero
        }
        if isPortrait() == true {
            let x: CGFloat = (contentRect.width - image.size.width) * 0.5
            let y: CGFloat = (contentRect.height - image.size.height) * 0.5
            return CGRectMake(x, y, image.size.width, image.size.height)
        } else {
            var frame = super.imageRectForContentRect(contentRect)
            frame.origin.x = self.frame.width * 0.2
            return frame
        }
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        if isPortrait() == true {
            return CGRectZero
        } else {
            return super.titleRectForContentRect(contentRect)
        }
    }

}
