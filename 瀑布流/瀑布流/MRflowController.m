//
//  MRflowController.m
//  瀑布流
//
//  Created by admin on 15/4/13.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "MRflowController.h"
#import "MRHeader.h"

@interface MRflowController ()

@end

@implementation MRflowController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    MRHeader *header = nil;
    if([kind isEqual:UICollectionElementKindSectionHeader]){
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
        //header.headerLabel.text = @"爱车和美女";
    }
    return header;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
