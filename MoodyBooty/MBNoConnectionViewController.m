//
//  MBNoConnectionViewController.m
//  MoodyBooty
//
//  Created by paubins on 8/16/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBNoConnectionViewController.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MBTextView.h"



@interface MBNoConnectionViewController ()

@end

@implementation MBNoConnectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view.userInteractionEnabled = YES;
    self.view.backgroundColor = [UIColor colorWithRed:29.0/255.0 green:102.0/255.0 blue:111.0/255.0 alpha:1.0];
    
    UIImage *imageSmiley = [UIImage imageNamed:@"nointernet"];
    
    UIImageView *imageSmileyView = [[UIImageView alloc] initWithImage:imageSmiley];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    UIButton *backButton;
    UIBezierPath *linePath2;
    CAShapeLayer *line2;
    UILabel *crap;
    UILabel *noConnectionString;
    
    linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    line2 = [CAShapeLayer layer];
    line2.path = [linePath2 CGPath];
    line2.fillColor = [UIColor colorWithRed:68.0/255.0 green:147.0/255.0 blue:157.0/255.0 alpha:1].CGColor;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            imageSmileyView.frame = CGRectMake(320/2-imageSmiley.size.width/2, 255, imageSmiley.size.width, imageSmiley.size.height);
            line2.frame = CGRectMake(0, 500, 320, 1);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, 320, 146/2)];
            crap = [[UILabel alloc] initWithFrame:CGRectMake(0, 195, screenSize.width, 40)];
            noConnectionString = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, screenSize.width, 40)];
        } else {
            imageSmileyView.frame = CGRectMake(320/2-imageSmiley.size.width/2, 225, imageSmiley.size.width, imageSmiley.size.height);
            line2.frame = CGRectMake(0, 410, 320, 1);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 410, 320, 146/2)];
            crap = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, screenSize.width, 40)];
            noConnectionString = [[UILabel alloc] initWithFrame:CGRectMake(0, 175, screenSize.width, 40)];
        }
    }
    
    NSMutableAttributedString *attributedString4;

    attributedString4 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Try Again", nil) uppercaseString]];
    [attributedString4 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString4.length)];
    
    [backButton setAttributedTitle:attributedString4 forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchDown];
    [backButton setValue:[UIFont fontWithName:@"SourceSansPro-Regular" size:36/2] forKey:@"font"];
    backButton.titleLabel.textColor = [UIColor whiteColor];
    
    
    NSMutableAttributedString *attributedString2;

    crap.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:14];
    crap.textColor = [UIColor whiteColor];
    crap.textAlignment = NSTextAlignmentCenter;
    crap.backgroundColor = [UIColor clearColor];
    
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Aw crap", nil) uppercaseString]];
    [attributedString2 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString2.length)];
    [crap setAttributedText:attributedString2];
    
    
    NSMutableAttributedString *attributedString3;
    
    noConnectionString.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:14];
    noConnectionString.textColor = [UIColor whiteColor];
    noConnectionString.textAlignment = NSTextAlignmentCenter;
    noConnectionString.backgroundColor = [UIColor clearColor];
    
    attributedString3 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"No internet connection", nil) uppercaseString]];
    [attributedString3 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString3.length)];
    [noConnectionString setAttributedText:attributedString3];

    [self.view.layer addSublayer:line2];
    [self.view addSubview:noConnectionString];
    [self.view addSubview:crap];
    [self.view addSubview:backButton];
    [self.view addSubview:imageSmileyView];
    
}

-(void)closeModal
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    [self.view.window.layer addAnimation:transition forKey:nil];
    
    [self dismissViewControllerAnimated:NO completion:^{
        if ([self.delegate respondsToSelector:@selector(restartConnection)]) {
            [self.delegate performSelector:@selector(restartConnection)];
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
