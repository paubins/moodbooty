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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view.userInteractionEnabled = YES;
    
    self.view.backgroundColor = [UIColor colorWithRed:29.0/255.0 green:102.0/255.0 blue:111.0/255.0 alpha:1.0];
    
    
    UIImage *imageSmiley = [UIImage imageNamed:@"Smiley_1"];
    
    UIImageView *imageSmileyView = [[UIImageView alloc] initWithImage:imageSmiley];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            imageSmileyView.frame = CGRectMake(320/2-imageSmiley.size.width/2, 420, imageSmiley.size.width, imageSmiley.size.height);
        } else {
            imageSmileyView.frame = CGRectMake(320/2-imageSmiley.size.width/2, 350, imageSmiley.size.width, imageSmiley.size.height);
        }
    }
    
    UIButton *backButton;
    UIBezierPath *linePath2;
    CAShapeLayer *line2;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
            
            //shape layer for the line
            line2 = [CAShapeLayer layer];
            line2.path = [linePath2 CGPath];
            line2.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line2.frame = CGRectMake(0, 480, 320, 1);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 480, 320, 146/2)];
        } else {
            linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
            
            //shape layer for the line
            line2 = [CAShapeLayer layer];
            line2.path = [linePath2 CGPath];
            line2.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line2.frame = CGRectMake(0, 390, 320, 1);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 390, 320, 146/2)];
        }
    }
    
    NSMutableAttributedString *attributedString4;

    attributedString4 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Try Again", nil) uppercaseString]];
    [attributedString4 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString4.length)];
    
    [backButton setAttributedTitle:attributedString4 forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchDown];
    [backButton setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:36/2] forKey:@"font"];
    backButton.titleLabel.textColor = [UIColor whiteColor];
    
    
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




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
