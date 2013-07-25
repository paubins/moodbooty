//
//  MBQuoteCollectionViewCell.m
//  MoodyBooty
//
//  Created by paubins on 7/24/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteCollectionViewCell.h"
#import "MBQuoteView.h"

@implementation MBQuoteCollectionViewCell

+ (u_int32_t)randomInRangeLo:(u_int32_t)loBound toHi:(u_int32_t)hiBound
{
    u_int32_t random;
    int32_t   range = hiBound - loBound + 1;
    
    u_int32_t limit = UINT32_MAX - (UINT32_MAX % range);
    
    do {
        random = arc4random();
    } while (random > limit);
    
    return loBound + (random % range);
}

- (id) initWithFrame:(CGRect)frame
{
    NSArray *array = @[[UIColor whiteColor], [UIColor greenColor], [UIColor orangeColor], [UIColor blueColor]];
    
    self = [super initWithFrame:frame];
    if ( self ) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor grayColor];
        self.label.font = [UIFont boldSystemFontOfSize:10.0];
        self.label.backgroundColor = array[random() % 4];
        self.label.text = @"Test";
        
        [self.contentView addSubview:self.label];
        
    }
    
    return self;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //MBQuoteCollectionViewCell *cell = (MBQuoteCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"Clicked b");
}

@end
