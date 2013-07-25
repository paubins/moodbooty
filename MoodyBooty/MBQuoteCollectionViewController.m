//
//  MBQuoteCollectionViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/24/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteCollectionViewController.h"
#import "MBQuoteCollectionViewCell.h"
#import "MBQuoteUICollectionViewLayout.h"

@implementation MBQuoteCollectionViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor greenColor]];
    
    return cell;
}

@end
