//
//  MBQuoteView.m
//  MoodyBooty
//
//  Created by paubins on 8/18/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteView.h"
#import "MBTextView.h"

#define kDefaultFontSize  50.0

@implementation MBQuoteView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews
{
    UIImage *image = [UIImage imageNamed:@"Smiley_2"];
    
    UILabel *attributedTo;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    MBTextView *label = [[MBTextView alloc] initWithFrame:CGRectMake(35, 160, 250, 170)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(320/2 - ceil(image.size.width/2), 105, image.size.width, image.size.height);
    imageView.contentMode = UIViewContentModeCenter;
    
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\u201C%@\u201D", self.quote]];
    [attributedString2 addAttribute:NSKernAttributeName value:@0 range:NSMakeRange(0, attributedString2.length)];
    [label setAttributedText:attributedString2];
    
    label.scrollEnabled = NO;
    label.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:kDefaultFontSize];
    
    CGSize fontSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(230,9999)];
    
    if (fontSize.height > 150) {
        int newFontSize = kDefaultFontSize;
        while (fontSize.height >= 150 || fontSize.width > 250 ) {
            label.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:newFontSize--];
            fontSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(230,9999)];
        }
    }
    
    
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.editable = NO;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            attributedTo = [[UILabel alloc] initWithFrame:CGRectMake(0, 340, 320, 40)];
        } else {
            attributedTo = [[UILabel alloc] initWithFrame:CGRectMake(0, 320, 320, 40)];
        }
    }
    
    attributedTo.backgroundColor = [UIColor clearColor];
    attributedTo.textAlignment = NSTextAlignmentCenter;
    attributedTo.textColor = [UIColor whiteColor];
    [attributedTo setFont:[UIFont fontWithName:@"SourceSansPro-Regular" size:16]];
    
    NSMutableAttributedString *attributedString3;
    attributedString3 = [[NSMutableAttributedString alloc] initWithString:[self.quoted uppercaseString]];
    [attributedString3 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString3.length)];
    
    [attributedTo setAttributedText:attributedString3];
    
    [self addSubview:imageView];
    [self addSubview:label];
    [self addSubview:attributedTo];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
