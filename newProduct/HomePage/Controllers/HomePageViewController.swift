//
//  HomePageViewController.swift
//  new product
//
//  Created by pgw on 2018/3/14.
//  Copyright © 2018年 pgw. All rights reserved.
//

import UIKit

class HomePageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navItem.title = "新闻首页"
        let pushBtn = UIButton.init()
        pushBtn.setTitle( "点我", for: .normal)
        pushBtn.frame = CGRect.init(x: 100, y: 100, width: 50, height: 60)
        view.addSubview(pushBtn)
        pushBtn.addTarget(self, action: #selector(pop), for: .touchUpInside)
    }
    @objc func pop(){
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
