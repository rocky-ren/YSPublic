//
//  RPhotoBrowser.h
//  YSPublicDemo
//
//  Created by rocky on 2018/7/11.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RPhotoBrowserModel.h"

@class RPhotoBrowser;

typedef void(^PhotoBrowserScrollAtIndex)(NSInteger index, RPhotoBrowserModel *model, RPhotoBrowser *p);
typedef void(^PhotoBrowserClickAtIndex)(NSInteger index, RPhotoBrowserModel *model, RPhotoBrowser *p);
typedef void(^PhotoBrowserLongClickAtIndex)(NSInteger index, RPhotoBrowserModel *model, RPhotoBrowser *p);

@interface RPhotoBrowser : UIView

- (void)showInView:(UIView *)view dataSource:(NSArray<RPhotoBrowserModel *> *)dataSource index:(NSInteger)index;
- (void)dismiss;

@property (copy, nonatomic) PhotoBrowserScrollAtIndex scrollAtIndex;
@property (copy, nonatomic) PhotoBrowserClickAtIndex clickAtIndex;
@property (copy, nonatomic) PhotoBrowserLongClickAtIndex longClickAtIndex;

@end


