//
//  MBQuoteCollectionViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/24/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteCollectionViewController.h"

@implementation MBQuoteCollectionViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.collectionView.dataSource = self;
    
    self.view.backgroundColor = [UIColor greenColor];
    self.collectionView.frame = self.view.bounds;
    
    self.items = @[@"mood1", @"mood2", @"mood3", @"mood4"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.items count];
}




@end
