//
//  HomePageViewController.swift
//  new product
//
//  Created by pgw on 2018/3/14.
//  Copyright © 2018年 pgw. All rights reserved.
//

import UIKit
import SnapKit
class HomePageViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let channelScroll = UIScrollView()
    lazy var channelList = CZChannelModel.channelList()
    var navBarHeight:CGFloat = 64.0
    var statusBar:CGFloat = 20.0
    //记录当前的频道索引
    var currentChannelIndex:NSInteger = 0
    
    lazy var newsCollectionView : UICollectionView = {
        let collView = UICollectionView()
        collView.tag = 0
        return collView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navItem.title = "新闻首页"
        setUI()
        loadChannels()
    }
    func setUI() {
        view.addSubview(channelScroll)
        channelScroll.backgroundColor = UIColor.white
        channelScroll.frame = CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 40)
        setupCollection()
    }
    //MARK:CollectionView的布局及属性设置
    func setupCollection(){
        let layout = UICollectionViewFlowLayout()
        newsCollectionView = UICollectionView(frame: CGRect(x: 0, y: navBarHeight, width: SCREEN_WIDTH, height:SCREEN_HEIGHT), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.itemSize = self.newsCollectionView.frame.size
        newsCollectionView.backgroundColor = .red
        newsCollectionView.isUserInteractionEnabled = true
        newsCollectionView.collectionViewLayout = layout
        newsCollectionView.showsHorizontalScrollIndicator = true
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        newsCollectionView.register(MineCollectionViewCell.self, forCellWithReuseIdentifier: "brandId")
        view.addSubview(self.newsCollectionView)
        newsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.channelScroll.snp.bottom)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
    func loadChannels() {
        //当有导航栏的情况下,scrollview会默认有一个上边距,编剧的大小就是导航栏的高度
        self.automaticallyAdjustsScrollViewInsets = false
        let margin:CGFloat = 5
        var x = margin
        let height = self.channelScroll.frame.size.height
        for i in 0..<self.channelList!.count {
            let model = self.channelList![i] as! CZChannelModel
            let label = CZChannelLabel.init(tname: model.tname)
            label?.frame = CGRect.init(x: x, y: 0, width: (label?.frame.size.width)!, height: height)
            x += (label?.frame.size.width)!+margin
            label?.isUserInteractionEnabled = true
            //添加点击的手势
            let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(labelTap(tapGesture:)))
            label?.addGestureRecognizer(tapGesture)
            label?.tag = i
            self.channelScroll.addSubview(label!)
        }
        //设置滚动
        self.channelScroll.contentSize = CGSize.init(width: x, height: height)
        //设置第一个label文字变大变红
        let label = self.channelScroll.subviews[0] as! CZChannelLabel
        label.scale = 1
        
    }
    @objc func labelTap(tapGesture : UITapGestureRecognizer) {
        let label:CZChannelLabel = tapGesture.view as! CZChannelLabel
        let index = label.tag as! NSInteger
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("首页内存泄露！")
    }
    
}

extension HomePageViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.channelList?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandId", for: indexPath) as! MineCollectionViewCell
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let nextScale = self.newsCollectionView.contentOffset.x * 1.0/(self.newsCollectionView.frame.size.width - CGFloat(self.currentChannelIndex))
        let currentScale = 1-nextScale
        let currentLabel : CZChannelLabel = self.channelScroll.subviews[self.currentChannelIndex] as! CZChannelLabel
        
        var nextLabel:CZChannelLabel? = nil
        //遍历当前可见的indexPath,其中一个与当前新闻频道索引相对应,另外一个就是下一个频道的索引
        for indexPath in self.newsCollectionView.indexPathsForVisibleItems {
            if indexPath.item != self.currentChannelIndex{
                nextLabel = self.channelScroll.subviews[indexPath.item] as? CZChannelLabel
                break
            }
        }
        //给label进行赋值,改变lable中文字的大小和颜色
        currentLabel.scale = Float(currentScale)
        nextLabel?.scale = Float(nextScale)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        self.currentChannelIndex = self.newsCollectionView.contentOffset
    }
}
