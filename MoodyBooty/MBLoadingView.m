//
//  MBLoadingView.m
//  MoodyBooty
//
//  Created by paubins on 8/16/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBLoadingView.h"
#import "MBTextView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MBLoadingView

UIImageView *circle;
UIImageView *circle2;
UIImageView *circle3;

UIImageView *emptyCircle;
UIImageView *emptyCircle2;
UIImageView *emptyCircle3;

NSTimer *timer;

NSInteger off;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        MBTextView *loading;
        UITextView *patience;
        NSMutableAttributedString *attributedString2;
        NSMutableAttributedString *attributedString3;
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        
        circle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"filled"]];
        circle2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"filled"]];
        circle3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"filled"]];
        
        emptyCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"open"]];
        emptyCircle2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"open"]];
        emptyCircle3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"open"]];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if (screenSize.height > 480.0f) {
                loading = [[MBTextView alloc] initWithFrame:CGRectMake(0, 205, screenSize.width, 20)];
                patience = [[UITextView alloc] initWithFrame:CGRectMake(0, 275, screenSize.width, 20)];
                circle.frame = CGRectMake(130, 250, 11, 11);
                circle2.frame = CGRectMake(155, 250, 11, 11);
                circle3.frame = CGRectMake(180, 250, 11, 11);
                
                emptyCircle.frame = CGRectMake(130, 250, 11, 11);
                emptyCircle2.frame = CGRectMake(155, 250, 11, 11);
                emptyCircle3.frame = CGRectMake(180, 250, 11, 11);
            } else {
                loading = [[MBTextView alloc] initWithFrame:CGRectMake(0, 175, screenSize.width, 20)];
                patience = [[UITextView alloc] initWithFrame:CGRectMake(0, 245, screenSize.width, 20)];
                circle.frame = CGRectMake(130, 220, 11, 11);
                circle2.frame = CGRectMake(155, 220, 11, 11);
                circle3.frame = CGRectMake(180, 220, 11, 11);
                
                emptyCircle.frame = CGRectMake(130, 250, 11, 11);
                emptyCircle2.frame = CGRectMake(155, 250, 11, 11);
                emptyCircle3.frame = CGRectMake(180, 250, 11, 11);
            }
        }
        off = 1;
        if ( !timer ) {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(turnOff:) userInfo:nil repeats:YES];
        }
        
        loading.scrollEnabled = NO;
        loading.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:18];
        loading.textColor = [UIColor whiteColor];
        loading.textAlignment = NSTextAlignmentCenter;
        loading.backgroundColor = [UIColor clearColor];
        loading.editable = NO;
        
        attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Loading...", nil) uppercaseString]];
        [attributedString2 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString2.length)];
        [loading setAttributedText:attributedString2];
        
        patience.editable = NO;
        patience.backgroundColor = [UIColor clearColor];
        patience.textAlignment = NSTextAlignmentCenter;
        patience.textColor = [UIColor whiteColor];
        patience.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:18];
        
        attributedString3 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Patience is a virtue.", nil) uppercaseString]];
        [attributedString3 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString3.length)];
        
        [patience setAttributedText:attributedString3];
        
        [self addSubview:loading];
        
        [self addSubview:circle];
        [self addSubview:circle2];
        [self addSubview:circle3];
        
        circle.hidden = YES;
        circle2.hidden = YES;
        circle3.hidden = YES;
        
        [self addSubview:emptyCircle];
        [self addSubview:emptyCircle2];
        [self addSubview:emptyCircle3];
        
        [self addSubview:patience];
    }
    return self;
}




-(void)turnOff:(NSTimer *)timer
{
    
    circle.hidden = !( off == 1 );
    emptyCircle.hidden = ( off == 1 );

    circle2.hidden = !( off == 2 );
    emptyCircle2.hidden = ( off == 2 );

    circle3.hidden = !( off == 3 );
    emptyCircle3.hidden = ( off == 3 );
    
    if ( off == 3 ) {
        off = 1;
    } else {
        off++;
    }
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
