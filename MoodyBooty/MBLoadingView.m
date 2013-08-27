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


@synthesize circle = _circle;
@synthesize circle2 = _circle2;
@synthesize circle3 = _circle3;

@synthesize emptyCircle = _emptyCircle;
@synthesize emptyCircle2 = _emptyCircle2;
@synthesize emptyCircle3 = _emptyCircle3;

@synthesize timer = _timer;

@synthesize off = _off;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *loading;
        UILabel *patience;
        NSMutableAttributedString *attributedString2;
        NSMutableAttributedString *attributedString3;
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        
        _circle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"filled"]];
        _circle2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"filled"]];
        _circle3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"filled"]];
        
        _emptyCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"open"]];
        _emptyCircle2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"open"]];
        _emptyCircle3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"open"]];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if (screenSize.height > 480.0f) {
                loading = [[UILabel alloc] initWithFrame:CGRectMake(0, 205, screenSize.width, 20)];
                patience = [[UILabel alloc] initWithFrame:CGRectMake(0, 275, screenSize.width, 20)];
                _circle.frame = CGRectMake(130, 245, 11, 11);
                _circle2.frame = CGRectMake(155, 245, 11, 11);
                _circle3.frame = CGRectMake(180, 245, 11, 11);
                
                _emptyCircle.frame = CGRectMake(130, 245, 11, 11);
                _emptyCircle2.frame = CGRectMake(155, 245, 11, 11);
                _emptyCircle3.frame = CGRectMake(180, 245, 11, 11);
            } else {
                loading = [[UILabel alloc] initWithFrame:CGRectMake(0, 175, screenSize.width, 20)];
                patience = [[UILabel alloc] initWithFrame:CGRectMake(0, 245, screenSize.width, 20)];
                _circle.frame = CGRectMake(130, 215, 11, 11);
                _circle2.frame = CGRectMake(155, 215, 11, 11);
                _circle3.frame = CGRectMake(180, 215, 11, 11);
                
                _emptyCircle.frame = CGRectMake(130, 215, 11, 11);
                _emptyCircle2.frame = CGRectMake(155, 215, 11, 11);
                _emptyCircle3.frame = CGRectMake(180, 215, 11, 11);
            }
        }
        _off = 1;
        
        if ( _timer ) {
            [_timer invalidate];
            _timer = nil;
        } else {
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(turnOff:) userInfo:nil repeats:YES];
        }
        
        loading.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:18];
        loading.textColor = [UIColor whiteColor];
        loading.textAlignment = NSTextAlignmentCenter;
        loading.backgroundColor = [UIColor clearColor];
        
        attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Loading...", nil) uppercaseString]];
        [attributedString2 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString2.length)];
        [loading setAttributedText:attributedString2];
        
        patience.backgroundColor = [UIColor clearColor];
        patience.textAlignment = NSTextAlignmentCenter;
        patience.textColor = [UIColor whiteColor];
        patience.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:18];
        
        attributedString3 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Patience is a virtue.", nil) uppercaseString]];
        [attributedString3 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString3.length)];
        
        [patience setAttributedText:attributedString3];
        
        [self addSubview:loading];
        
        [self addSubview:_circle];
        [self addSubview:_circle2];
        [self addSubview:_circle3];
        
        _circle.hidden = YES;
        _circle2.hidden = YES;
        _circle3.hidden = YES;
        
        [self addSubview:_emptyCircle];
        [self addSubview:_emptyCircle2];
        [self addSubview:_emptyCircle3];
        
        [self addSubview:patience];
    }
    return self;
}


-(void)turnOff:(NSTimer *)timer
{
    
    _circle.hidden = !( _off == 1 );
    _emptyCircle.hidden = ( _off == 1 );

    _circle2.hidden = !( _off == 2 );
    _emptyCircle2.hidden = ( _off == 2 );

    _circle3.hidden = !( _off == 3 );
    _emptyCircle3.hidden = ( _off == 3 );
    
    if ( _off == 3 ) {
        _off = 1;
    } else {
        _off++;
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
