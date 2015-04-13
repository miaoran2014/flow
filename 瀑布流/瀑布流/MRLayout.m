//
//  MRLayout.m
//  瀑布流
//
//  Created by admin on 15/4/13.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "MRLayout.h"
#define w [UIScreen mainScreen].bounds.size.width
static int const columns=3;
static CGFloat const margin=10;

@interface MRLayout()

@property(nonatomic,strong)NSMutableArray* maxYs;
@end

@implementation MRLayout

-(NSArray *)maxYs{
    if(!_maxYs){
        _maxYs=[NSMutableArray arrayWithCapacity:columns];
        for (int i=0; i<columns; i++) {
            _maxYs[i]=@(margin);
        }
    }
    return _maxYs;
}

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
    CGFloat itemW=(w-(columns+1)*margin)/columns;
    CGFloat itemH=50+arc4random_uniform(200);
    int col=0;
    //一个三列,,取出最短的那一列
    CGFloat minY=[self.maxYs[0] floatValue];
    for (int i=1; i<columns; i++) {
        CGFloat temp=[self.maxYs[i] floatValue];
        if(temp<minY){
            minY=temp;
            //找到最短的列
            col=i;
        }
    }
    //没法改值
   //self.maxYs[col] floatValue]=[self.maxYs[col] floatValue]+margin+itemH;
    
    attr.frame=CGRectMake(margin+col*(margin+itemW), [self.maxYs[col] floatValue]+ margin, itemW, itemH);
    //更新每一列的maxY
    self.maxYs[col]=@(CGRectGetMaxY(attr.frame));
    return attr;
}
- (CGSize)collectionViewContentSize{
    CGFloat maxY=[self.maxYs[0] floatValue];
    for (int i=1; i<columns; i++) {
       CGFloat temp=[self.maxYs[i] floatValue];
        if(temp>maxY){
            maxY=temp;
        }
    }
    return CGSizeMake(w, maxY);
}
@end
