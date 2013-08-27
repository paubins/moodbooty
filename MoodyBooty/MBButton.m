//
//  MBButton.m
//  MoodyBooty
//
//  Created by paubins on 7/26/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBButton.h"

@implementation MBButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UILabel *titleLabel = [self titleLabel];
    [titleLabel setNeedsLayout];
    NSMutableAttributedString *attributedString4;
    attributedString4 = [[NSMutableAttributedString alloc] initWithString:[titleLabel.text uppercaseString]];
    [attributedString4 addAttribute:NSKernAttributeName value:@3 range:NSMakeRange(0, attributedString4.length)];
    [titleLabel setAttributedText:attributedString4];
    titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:36/2];
    
    
}

@end
