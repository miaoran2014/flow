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
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSInteger count=[self.collectionView numberOfItemsInSection:0];
    NSLog(@"%zu",count);
    NSMutableArray* arrM=[NSMutableArray array];
    for (int i=0; i<count; i++) {
        NSIndexPath* path=[NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes* attr=[self layoutAttributesForItemAtIndexPath:path];
    }
    return nil;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
