//
//  BaseNavigationController.swift
//  new product
//
//  Created by pgw on 2018/3/14.
//  Copyright © 2018年 pgw. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果是跟控制器就不需要隐藏tabbar
        /*
         我们打断点发现 执行这个方法的时候-> let nav = WBNavigationViewController(rootViewController: vc) 走我们这个作用域 为了防止返回到跟控制器
         tabbar消失我们做一下判断 ,刚一进来hildViewControllers.count为0
         */
        
        if childViewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
            //TODO: 左侧控制器返回问题
            //判断控制器类型
            if let vc = viewController as? BaseViewController {
                var title = " 返回"
                //判读控制器技术
                if  childViewControllers.count == 1{
//                    title = childViewControllers.first?.title ?? "返回"
                    title = " 返回"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, fontSize: 18, target: self, action: #selector(PopToParent), isBack: true  )
            }
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func PopToParent() {
        popViewController(animated: true )
    }

}
