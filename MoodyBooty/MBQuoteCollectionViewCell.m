//
//  MBQuoteCollectionViewCell.m
//  MoodyBooty
//
//  Created by paubins on 7/24/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteCollectionViewCell.h"

@implementation MBQuoteCollectionViewCell

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self ) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor grayColor];
        self.label.font = [UIFont boldSystemFontOfSize:35.0];
        self.label.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.label];
    }
    
    return self;
}

@end
