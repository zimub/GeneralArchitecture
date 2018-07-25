//
//  MineViewController.swift
//  new product
//
//  Created by pgw on 2018/3/14.
//  Copyright © 2018年 pgw. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {
    var topBgImageView : UIImageView?
    var backImgHeight:CGFloat = 0.0
    var backImgWidth:CGFloat = 0.0
    var backImgOrgy:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navItem.title = "个人中心"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
