//
//  UIBarButtunItem + Extensions.swift
//  文哥脸书
//
//  Created by pgw on 17/4/14.
//  Copyright © 2017年 pgw. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    convenience init(title: String,fontSize:CGFloat,target : AnyObject?,action:Selector,isBack:Bool = false ) {
        
        let btn : UIButton = WBBackButtun.wb_textButton(title: title, fontSize: fontSize, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
        
        if isBack {
            let imageName = "返回按钮"
            btn.setImage(UIImage(named: imageName), for: .normal)
            btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView:btn)
    }
    
}














































