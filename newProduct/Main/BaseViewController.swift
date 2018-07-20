//
//  BaseViewController.swift
//  new product
//
//  Created by pgw on 2018/3/14.
//  Copyright © 2018年 pgw. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame:CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 64))
    //自定义导航项
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        self.setUpNavigationBar()
    }

    //设置导航条
    func setUpNavigationBar(){
        let imagev = UIImageView.init(image: UIImage.init(named: "导航条"))
        imagev.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        self.view.addSubview(imagev)
        if DeviceInfo.isIphoneX(){
            navigationBar.frame = CGRect(x: 0, y: 44, width: UIScreen.main.bounds.width, height: 44)
        }else{
//            navigationBar.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 44)
            navigationBar.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 44)
        }//20
        //添加导航条
        navigationBar.backgroundColor = UIColor.red
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        //设置navigationBar的渲染颜色,解决透色问题
//        navigationBar.barTintColor = UIColor.white
        navigationBar.setBackgroundImage(UIImage.init(named: "导航条"), for: .default)//设置导航透明必不可少
//        navigationBar.barTintColor = UIColor.clear
        //设置navigationBar的字体颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
                let item = UIBarButtonItem.init(title:"", style: .done, target: self, action: nil)
                self.navItem.backBarButtonItem = item
    }

}
