//
//  MBAboutView.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBAboutViewController.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@implementation MBAboutViewController

- (void)loadView
{
    [super loadView];
    
    UIImage *image;
    CGSize screenSize = [UIScreen mainScreen].applicationFrame.size;
    
    if ( screenSize.height == 480.0f ) {
        image = [UIImage imageNamed:@"introbg@3_5"];
    } else {
        image = [UIImage imageNamed:@"intro_bg"];
    }
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height);
    
    UILabel *always = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, 320, 20)];
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"The glass is always", nil) uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@3 range:NSMakeRange(0, attributedString.length)];
    [always setAttributedText:attributedString];
    
    always.textColor = [UIColor colorWithRed:188.0/255.0 green:221.0/255.0 blue:232.0/255.0 alpha:1.0];
    always.backgroundColor = [UIColor clearColor];
    always.textAlignment = NSTextAlignmentCenter;
    always.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:27/2];
    
    UILabel *halfFull = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 320, 40)];
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Half full", nil) uppercaseString]];
    [attributedString2 addAttribute:NSKernAttributeName value:@3 range:NSMakeRange(0, attributedString2.length)];
    [halfFull setAttributedText:attributedString2];
    
    halfFull.textColor = [UIColor whiteColor];
    halfFull.backgroundColor = [UIColor clearColor];
    halfFull.textAlignment = NSTextAlignmentCenter;
    halfFull.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:72/2];
    halfFull.shadowColor = [UIColor blackColor];
    halfFull.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    UILabel *description;
    
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            description = [[UILabel alloc] initWithFrame:CGRectMake(40, 295, 240, 120)];
        } else {
            description = [[UILabel alloc] initWithFrame:CGRectMake(40, 213, 240, 120)];
        }
    }
    
    NSMutableAttributedString *attributedString3;
    attributedString3 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"The app that turns your frown upside down with a dose of inspiration to kick any bad mood in the butt!", nil) uppercaseString]];
    [attributedString3 addAttribute:NSKernAttributeName value:@3 range:NSMakeRange(0, attributedString3.length)];
    [description setAttributedText:attributedString3];
    
    description.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:27/2];
    description.textColor = [UIColor colorWithRed:188.0/255.0 green:221.0/255.0 blue:232.0/255.0 alpha:1.0];
    description.backgroundColor = [UIColor clearColor];
    description.numberOfLines = 0;
    description.textAlignment = NSTextAlignmentCenter;
    description.contentMode = UIViewContentModeTop;
    description.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view.userInteractionEnabled = YES;

    self.view.backgroundColor = [UIColor colorWithRed:29.0/255.0 green:102.0/255.0 blue:111.0/255.0 alpha:1.0];

    
    UIImage *imageSmiley = [UIImage imageNamed:@"Smiley_1"];
    
    UIImageView *imageSmileyView = [[UIImageView alloc] initWithImage:imageSmiley];
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            imageSmileyView.frame = CGRectMake(320/2-imageSmiley.size.width/2, 420, imageSmiley.size.width, imageSmiley.size.height);
        } else {
            imageSmileyView.frame = CGRectMake(320/2-imageSmiley.size.width/2, 333, imageSmiley.size.width, imageSmiley.size.height);
        }
    }
    
    UIButton *backButton;
    UIBezierPath *linePath2;
    CAShapeLayer *line2;
    
    linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    line2 = [CAShapeLayer layer];
    line2.path = [linePath2 CGPath];
    line2.fillColor = [UIColor colorWithRed:68.0/255.0 green:147.0/255.0 blue:157.0/255.0 alpha:1].CGColor;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            line2.frame = CGRectMake(0, 500, 320, 1);
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, 320, 146/2)];
        } else {
            line2.frame = CGRectMake(0, 410, 320, 1);
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 410, 320, 146/2)];
        }
    }
    
    NSMutableAttributedString *attributedString4;
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if ( ![prefs boolForKey:@"aboutShown"] ){
        attributedString4 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Next", nil) uppercaseString]];
    } else {
        attributedString4 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Back", nil) uppercaseString]];
    }
    [attributedString4 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString4.length)];

    [backButton setAttributedTitle:attributedString4 forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchDown];
    [backButton setValue:[UIFont fontWithName:@"SourceSansPro-Regular" size:36/2] forKey:@"font"];
    backButton.titleLabel.textColor = [UIColor whiteColor];
    
    
    [self.view addSubview:imageView];
    [self.view addSubview:always];
    [self.view addSubview:halfFull];
    [self.view addSubview:description];
    
    [self.view.layer addSublayer:line2];
    [self.view addSubview:backButton];
    
    [self.view addSubview:imageSmileyView];
    
}

-(void)closeModal
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    [self.view.window.layer addAnimation:transition forKey:nil];
    
    [self dismissViewControllerAnimated:NO completion:nil];
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
