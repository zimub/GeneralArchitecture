//
//  YJChannelManagerView.m
//  频道管理视图
//
//  Created by yj on 16/6/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJChannelManagerView.h"
#import "YJChannelCell.h"
#import "YJChannelHeadSetionView.h"
#import "YJAddChannelHeadSetionView.h"
#import "YJButton.h"

@interface YJChannelManagerView ()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UICollectionView *collectionView;

@property (assign,nonatomic) BOOL isEditable; // 是否编辑

@property (strong,nonatomic) NSIndexPath *startIndexPath; // 开始indexPath

@property (strong,nonatomic) NSIndexPath *moveIndexPath; // 移动的indexPath

@property (strong,nonatomic) UIView *tempCell; // 临时的cell

@property (assign,nonatomic) CGPoint lastPoint;

@property (strong,nonatomic) UILongPressGestureRecognizer *longGesture;

@end

static NSString *channelCellReuseID = @"channelCellReuseID";
static NSString *headSetionReuseID = @"headSetionReuseID";
static NSString *addChannelSetionReuseID = @"addChannelSetionReuseID";

@implementation YJChannelManagerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat margin = 10;
        CGFloat itemWidth = (KScreenWidth - 5*margin)/4;
        CGFloat itemHeght = 44;
        layout.itemSize = CGSizeMake(itemWidth, itemHeght);
        layout.minimumInteritemSpacing = margin;
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.headerReferenceSize = CGSizeMake(KScreenHeight, 35);

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0) collectionViewLayout:layout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YJChannelCell class]) bundle:nil] forCellWithReuseIdentifier:channelCellReuseID];
        [_collectionView registerClass:[YJChannelHeadSetionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headSetionReuseID];
        
        [_collectionView registerClass:[YJAddChannelHeadSetionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:addChannelSetionReuseID];
        
       
        self.hidden = YES;
        
        [self addSubview:_collectionView];
        
    }
    return self;
}



#pragma mark - 公开方法
- (void)yj_show {

    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = _collectionView.frame;
        frame.size.height = self.frame.size.height;
        _collectionView.frame = frame;

        self.hidden = NO;
        [_collectionView reloadData];
    }];
    
 
}

- (void)yj_hide {

    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = _collectionView.frame;
        frame.size.height = 0;
        _collectionView.frame = frame;
        
        self.hidden = YES;
          [_collectionView reloadData];
    }];
    
    
}



#pragma mark - UICollectionViewDataSource 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section  {

    if (section == 0) {
        

            
        return self.showChannelsDataSource().count;
        
    }
    else {
    
        return  self.hideChannelDataSource().count;
        
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    YJChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:channelCellReuseID forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        
        cell.channelNameLabel.text = self.showChannelsDataSource()[indexPath.row];
        cell.isEidtable = _isEditable;
        
        [cell setDeleteBlock:^(YJChannelCell *channelCell, UIButton *deleteBtn) {
           
            if (self.deleChannelBlock) {
                
                self.deleChannelBlock(indexPath.row);
               
                
                [_collectionView reloadData];
            }
        }];
        

        
    }
    else {
    
        cell.channelNameLabel.text = self.hideChannelDataSource()[indexPath.row];
        cell.isEidtable = NO;
    }
    
    
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return _isEditable? 1:2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        
        YJChannelHeadSetionView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headSetionReuseID forIndexPath:indexPath];

        if (!_isEditable) {
            
            headView.titleLabel.text = @"切换频道";
        }else {
        
            headView.titleLabel.text = @"长按拖动排序";
        }
      
        
        [headView.eidtButton yj_addHandler:^(YJButton *button) {
           
            button.selected = !button.selected;
            _isEditable = button.selected;
            
            if (_isEditable) {
                //如果处于编辑状态就添加一个长按手势
                UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
                
                longPressGesture.minimumPressDuration = 0.2;
                _longGesture = longPressGesture;
                _longGesture.delegate = self;
                [_collectionView addGestureRecognizer:longPressGesture];
                
            }
            else {
            
                //移除手势
                [_collectionView removeGestureRecognizer:_longGesture];
            }
            
            
            [_collectionView reloadData];
        }];
        
        return headView;
    }
    else {
    
        YJAddChannelHeadSetionView *addHeadView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:addChannelSetionReuseID forIndexPath:indexPath];
        
        addHeadView.titleLabel.text = @"点击添加更多频道";
        return addHeadView;
        
    }
    
 
    
}
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    //如果处于编辑状态就不能点击
    if (_isEditable) {
        
        return;
    }
    
    if (indexPath.section == 0) {
        
        //点击跳转
        if (self.selectChannelBlock) {
            
            self.selectChannelBlock(indexPath.row);
        }
    }
    else {
    
        // 点击添加
        
        if (self.addChannelBlock) {
            self.addChannelBlock(indexPath.row);
        }
        
    }
    
    [_collectionView reloadData];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {

    if ([touch isKindOfClass:[YJButton class]]) {
        
        return NO;
    }
    else{
    
        
        return YES;
    }
   
}



#pragma mark - 长按手势处理

- (void)longPress:(UILongPressGestureRecognizer*)longPress {

    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
        {
        
            NSLog(@"开始长按手势");
            //获取长按的点
            CGPoint point = [longPress locationInView:_collectionView];
            
            _startIndexPath = [_collectionView indexPathForItemAtPoint:point];
            //获取手指所在的cell
            YJChannelCell *cell = (YJChannelCell*)[_collectionView cellForItemAtIndexPath:_startIndexPath];
            
            cell.hidden = YES;
            //获取当前cell的截图
            UIView *tempMoveCell = [cell snapshotViewAfterScreenUpdates:NO];
            _tempCell = tempMoveCell;
            _tempCell.frame = cell.frame;
            _tempCell.layer.affineTransform = CGAffineTransformMakeScale(1.2, 1.2);
            
            [_collectionView addSubview:_tempCell];
            
            _lastPoint = [longPress locationInView:_collectionView];
            
            
            
            
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            
            
            CGFloat tranX = [longPress locationInView:longPress.view].x - _lastPoint.x;
            CGFloat tranY = [longPress locationInView:longPress.view].y - _lastPoint.y;
            _tempCell.center = CGPointApplyAffineTransform(_tempCell.center, CGAffineTransformMakeTranslation(tranX, tranY));
            
            _lastPoint = [longPress locationInView:_collectionView];
            
            for (YJChannelCell *cell in [_collectionView visibleCells]) {
               
                NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
                
                if (indexPath == _startIndexPath || indexPath.section == 1) {
                    
                    continue;
                }
                
                
                //计算中心距
                CGFloat spacingX = fabs(_tempCell.center.x - cell.center.x);
                CGFloat spacingY = fabs(_tempCell.center.y - cell.center.y);
                if (spacingX <= _tempCell.bounds.size.width / 2.0f && spacingY <= _tempCell.bounds.size.height / 2.0f) {
                    _moveIndexPath = [_collectionView indexPathForCell:cell];
                   
                    // 移动cell
                    [_collectionView moveItemAtIndexPath:_startIndexPath toIndexPath:_moveIndexPath];
                    
                    
                    // 通知外面
                    if (self.exchangeChannelBlock) {
                        
                        self.exchangeChannelBlock(_startIndexPath.row,_moveIndexPath.row);
                    }
                    
                    //设置移动后的起始indexPath
                    _startIndexPath = _moveIndexPath;
                    break;
                }
            }

        }
            break;
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            
            NSLog(@"开始结束或者取消");
            
           
            //获取最后的cell
            YJChannelCell *cell = (YJChannelCell*)[_collectionView cellForItemAtIndexPath:_startIndexPath];
            
            [UIView animateWithDuration:0.25 animations:^{
               
                _tempCell.center = cell.center;
            } completion:^(BOOL finished) {
                
                [_tempCell removeFromSuperview];
                
                cell.hidden  = NO;
               
                
            }];
            
        }
            break;
            
        default:
            break;
    }
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    //很重要
    _longGesture.enabled = [_collectionView indexPathForItemAtPoint:point];
    
   return  [super hitTest:point withEvent:event];
}




#pragma mark - 懒加载

@end
