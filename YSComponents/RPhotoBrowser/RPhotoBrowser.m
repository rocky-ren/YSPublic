//
//  RPhotoBrowser.m
//  YSPublicDemo
//
//  Created by rocky on 2018/7/11.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import "RPhotoBrowser.h"

#import "YSPublic.h"

#import "RPhotoBrowserItemCell.h"

#define kImgMargin 10

static NSString *ident = @"RPhotoBrowserItemCell";

@interface RPhotoBrowser () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation RPhotoBrowser

- (void)dismiss {
    self.collectionView.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)showInView:(UIView *)view dataSource:(NSArray<RPhotoBrowserModel *> *)dataSource index:(NSInteger)index {
    self.frame = view.bounds;
    [view addSubview:self];
    [self addSubview:self.collectionView];
    
    self.collectionView.hidden = YES;
    self.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = UIColorFromRGBX(0x000000, 0.5);
    } completion:^(BOOL finished) {
        self.collectionView.hidden = NO;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                                    atScrollPosition:UICollectionViewScrollPositionNone
                                            animated:NO];
    }];
    
    
    self.dataSource = dataSource;
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.scrollAtIndex) {
        self.scrollAtIndex(indexPath.row, self.dataSource[indexPath.row], self);
    }
    
    RPhotoBrowserItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ident forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    
    __weak typeof(self) weakSelf = self;
    [cell setLongClick:^(RPhotoBrowserItemCell *c) {
        if (weakSelf.longClickAtIndex) {
            NSIndexPath *ind = [weakSelf.collectionView indexPathForCell:c];
            weakSelf.longClickAtIndex(ind.row, weakSelf.dataSource[ind.row], weakSelf);
        }
    }];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.clickAtIndex) {
        self.clickAtIndex(indexPath.row, self.dataSource[indexPath.row], self);
    }
}


#pragma mark - getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        CGRect frame = CGRectMake(0, 0, self.frame.size.width+kImgMargin, self.frame.size.height);
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = kImgMargin;
        layout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, kImgMargin);
        [_collectionView registerClass:[RPhotoBrowserItemCell class] forCellWithReuseIdentifier:ident];
    }
    return _collectionView;
}

@end
