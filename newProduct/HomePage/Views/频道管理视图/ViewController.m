//
//  ViewController.m
//  频道管理视图
//
//  Created by yj on 16/6/29.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "ViewController.h"
#import "YJChannelManagerView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *shakeView;

@property (strong,nonatomic)YJChannelManagerView *chanelMangerView;

@property (strong,nonatomic) NSMutableArray *showChannels;

@property (strong,nonatomic) NSMutableArray *hideChannels;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _chanelMangerView = [[YJChannelManagerView alloc] initWithFrame:CGRectMake(0, 50, KScreenWidth, KScreenHeight - 50)];
    
    
  
    __weak typeof(self) weakSelf = self;
    // 设置显示的频道
    [_chanelMangerView setShowChannelsDataSource:^NSMutableArray *{
       
        return weakSelf.showChannels;
    }];
    NSLog(@"dff");
    
    // 设置不显示的频道
    [_chanelMangerView setHideChannelDataSource:^NSMutableArray *{
       
        return weakSelf.hideChannels;
    }];
    
    
    // 添加频道
    
    [_chanelMangerView setAddChannelBlock:^(NSUInteger index) {
       
        NSString *str = weakSelf.hideChannels[index];
        
        [weakSelf.hideChannels removeObjectAtIndex:index];
        
        [weakSelf.showChannels addObject:str];
    }];
    
    //点击频道
    [_chanelMangerView setSelectChannelBlock:^(NSUInteger index) {
       
        
        NSLog(@"----被选中%@",weakSelf.showChannels[index]);
        
        [weakSelf.chanelMangerView yj_hide];
    }];
    
    
    // 删除频道
    
    [_chanelMangerView setDeleChannelBlock:^(NSUInteger index) {
       
        NSString *str = weakSelf.showChannels[index];
        
        [weakSelf.showChannels removeObjectAtIndex:index];
        
        [weakSelf.hideChannels insertObject:str atIndex:0];
        
    }];
    
    
    [self.view addSubview:_chanelMangerView];
  
   
}


- (IBAction)showMenu:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        
        [_chanelMangerView yj_show];
        
        
   
    }
    else {
    
        [_chanelMangerView yj_hide];
        
           }
    
}

#pragma mark - 懒加载

- (NSMutableArray*)showChannels {
    
    if (_showChannels  == nil) {
        
        NSArray *arr = @[@"鲜闻",@"头条",@"娱乐",@"科技",@"创新",@"鲜闻",@"头条",@"娱乐",@"科技",@"创新",@"鲜闻",@"头条",@"娱乐",@"科技",@"创新",@"鲜闻",@"头条",@"娱乐",@"科技",@"创新",@"鲜闻",@"头条",@"娱乐",@"科技",@"创新"];
        
        _showChannels = [arr mutableCopy];
    }
    return _showChannels;
}


- (NSMutableArray*)hideChannels {
    
    if (_hideChannels  == nil) {
        
        
        _hideChannels = [@[@"我也",@"坑爹",@"无语",@"什么情况"] mutableCopy];
        
        
    }
    return _hideChannels;
}



- (void)shaekAnimation {

    
//    [_shakeView.layer addAnimation:shakeKey forKey:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
