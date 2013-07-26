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
    NSArray *array = @[
                       @[@"angry", [UIColor colorWithRed:232.0/255.0 green:92.0/255.0 blue:65.0/255.0 alpha:1]], // red
                       @[@"impatient", [UIColor colorWithRed:115.0/255.0 green:208.0/255.0 blue:181.0/255.0 alpha:1]], // teal
                       @[@"anxious", [UIColor colorWithRed:92.0/255.0 green:106.0/255.0 blue:136.0/255.0 alpha:1]], // purple
                       @[@"lonely", [UIColor colorWithRed:82.0/255.0 green:186.0/255.0 blue:213.0/255.0 alpha:1]], // blue
                       @[@"depressed", [UIColor colorWithRed:146.0/255.0 green:139.0/255.0 blue:137.0/255.0 alpha:1]], // brown
                       @[@"tired", [UIColor colorWithRed:190.0/255.0 green:179.0/255.0 blue:162.0/255.0 alpha:1]], // light brown
                       @[@"sad", [UIColor colorWithRed:254.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1]], // golden yellow
                       @[@"nostalgic", [UIColor colorWithRed:251.0/255.0 green:161.0/255.0 blue:125.0/255.0 alpha:1]], // pink
                       @[@"jealous", [UIColor colorWithRed:131.0/255.0 green:136.0/255.0 blue:92.0/255.0 alpha:1]], // pink
                       ];
    
    self = [super initWithFrame:frame];
    if ( self ) {
        NSInteger idx = random() % [array count];
        NSString *mood = array[idx][0];
        UIColor *color = array[idx][1];
        
        UIImage *image = [UIImage imageNamed:mood];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width+7, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor grayColor];
        self.label.font = [UIFont boldSystemFontOfSize:10.0];
        self.label.backgroundColor = color;
        self.label.text = mood;
        
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:imageView];
        
    }
    
    return self;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //MBQuoteCollectionViewCell *cell = (MBQuoteCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"Clicked b");
}

@end
