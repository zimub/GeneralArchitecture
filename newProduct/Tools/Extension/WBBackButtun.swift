//
//  WBBackButtun.swift
//  文哥脸书
//
//  Created by pgw on 17/4/17.
//  Copyright © 2017年 pgw. All rights reserved.
//

import UIKit

class WBBackButtun: NSObject {

    class func wb_textButton(title: String, fontSize: CGFloat, normalColor: UIColor, highlightedColor: UIColor, backgroundImageName: String,isBack :Bool = false) -> (UIButton) {
        
        let button: UIButton? = UIButton.init()
        button?.setTitle(title, for: .normal)
        button?.setTitleColor(normalColor, for: .normal)
        button?.setTitleColor(highlightedColor, for: .highlighted)
        button?.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        if backgroundImageName.lengthOfBytes(using: String.Encoding(rawValue: String.Encoding.utf16.rawValue))>0 {
            button?.setBackgroundImage(UIImage(named: backgroundImageName), for: .normal)
            let backgroundImageNameHL: String = backgroundImageName + ("_hightlighted")
            button?.setBackgroundImage(UIImage(named: backgroundImageNameHL), for: .highlighted)
            
        }
        button?.sizeToFit()
        return button!
        
    }
    
}
