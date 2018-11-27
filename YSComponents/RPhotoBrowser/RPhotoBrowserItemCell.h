//
//  RPhotoBrowserItemCell.h
//  YSPublicDemo
//
//  Created by rocky on 2018/7/11.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RPhotoBrowserModel.h"

@class RPhotoBrowserItemCell;

typedef void(^LongClick)(RPhotoBrowserItemCell *c);

@interface RPhotoBrowserItemCell : UICollectionViewCell

@property (copy, nonatomic) LongClick longClick;

@property (strong, nonatomic) RPhotoBrowserModel *model;

@end
