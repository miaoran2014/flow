//
//  MRLayout.m
//  瀑布流
//
//  Created by admin on 15/4/13.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "MRLayout.h"
static int const columns=3;
static CGFloat const margin=10;

@implementation MRLayout

- (void)prepareLayout{
    [super prepareLayout];
}

//一次性获取所有cell,补充,装饰的布局属性
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSInteger count=[self.collectionView numberOfItemsInSection:0];
    NSMutableArray* arrM=[NSMutableArray array];
    for (int i=0; i<count; i++) {
        NSIndexPath* path=[NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes* attr=[self layoutAttributesForItemAtIndexPath:path];
        [arrM addObject:attr];
    }
    return arrM;
}
//为layoutAttributesForElementsInRect返回的数组里的布局属性进行布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    //获取self layoutAttributesForItemAtIndexPath:path 传递过来 指定item的布局属性
    UICollectionViewLayoutAttributes* attr=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    /**
     * @property (nonatomic) CGRect frame;
     @property (nonatomic) CGPoint center;
     @property (nonatomic) CGSize size;
     @property (nonatomic) CATransform3D transform3D;
     @property (nonatomic) CGRect bounds NS_AVAILABLE_IOS(7_0);
     @property (nonatomic) CGAffineTransform transform NS_AVAILABLE_IOS(7_0);
     @property (nonatomic) CGFloat alpha;
     @property (nonatomic) NSInteger zIndex;
     */
    attr.frame=CGRectMake(100, 100, 100, 100);
    return attr;
}

@end
