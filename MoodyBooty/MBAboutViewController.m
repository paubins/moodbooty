//
//  MBAboutView.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBAboutViewController.h"
#import "MBAboutView.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@implementation MBAboutViewController

- (void)loadView
{
    [super loadView];
    
    UIImage *image = [UIImage imageNamed:@"Intro_BG"];
    UIImage *milkImage = [UIImage imageNamed:@"Milk_Glass"];
    
    UIImageView *milkImageView = [[UIImageView alloc] initWithImage:milkImage];
    milkImageView.frame = CGRectMake(0, 150, milkImage.size.width, milkImage.size.height);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height);
    
    UILabel *always = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 20)];
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[@"The glass is always" uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString.length)];
    [always setAttributedText:attributedString];
    
    always.textColor = [UIColor colorWithRed:125.0/255.0 green:177.0/255.0 blue:183.0/255.0 alpha:1.0];
    always.backgroundColor = [UIColor clearColor];
    always.textAlignment = NSTextAlignmentCenter;
    always.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:26/2];
//    always.shadowColor = [UIColor blackColor];
//    always.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    
    UILabel *halfFull = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 320, 40)];
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:[@"Half full" uppercaseString]];
    [attributedString2 addAttribute:NSKernAttributeName value:@3 range:NSMakeRange(0, attributedString2.length)];
    [halfFull setAttributedText:attributedString2];
    
    halfFull.textColor = [UIColor whiteColor];
    halfFull.backgroundColor = [UIColor clearColor];
    halfFull.textAlignment = NSTextAlignmentCenter;
    halfFull.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:72/2];
    halfFull.shadowColor = [UIColor blackColor];
    halfFull.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    UILabel *description;
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            description = [[UILabel alloc] initWithFrame:CGRectMake(40, 300, 240, 120)];
        } else {
            description = [[UILabel alloc] initWithFrame:CGRectMake(40, 230, 240, 120)];
        }
    }
    
    NSMutableAttributedString *attributedString3;
    attributedString3 = [[NSMutableAttributedString alloc] initWithString:[@"The app that turns your\r frown upside down with\r a dose of inspiration to\r kick any bad mood\r in the butt!" uppercaseString]];
    [attributedString3 addAttribute:NSKernAttributeName value:@3 range:NSMakeRange(0, attributedString3.length)];
    [description setAttributedText:attributedString3];
    
    description.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:27/2];
    description.textColor = [UIColor colorWithRed:188.0/255.0 green:221.0/255.0 blue:232.0/255.0 alpha:1.0];
    description.backgroundColor = [UIColor clearColor];
    description.numberOfLines = 0;
    description.textAlignment = NSTextAlignmentCenter;
    description.contentMode = UIViewContentModeTop;
    description.lineBreakMode = NSLineBreakByWordWrapping;
//    description.shadowColor = [UIColor blackColor];
//    description.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    
    self.view = [[MBAboutView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view.userInteractionEnabled = YES;

    self.view.backgroundColor = [UIColor colorWithRed:29.0/255.0 green:102.0/255.0 blue:111.0/255.0 alpha:1.0];

    
    UIImage *imageSmiley = [UIImage imageNamed:@"Smiley_1"];
    
    UIImageView *imageSmileyView = [[UIImageView alloc] initWithImage:imageSmiley];
    
    
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
    
    [backButton setTitle:[@"Back" uppercaseString] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchDown];
    [backButton setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:36/2] forKey:@"font"];
    
//    [[backButton layer] setBorderWidth:2.0f];
//    [[backButton layer] setBorderColor:[UIColor greenColor].CGColor];
    
    

    
    [self.view addSubview:imageView];
    //[self.view addSubview:milkImageView];
    [self.view addSubview:always];
    [self.view addSubview:halfFull];
    [self.view addSubview:description];
    
    [self.view.layer addSublayer:line2];
    [self.view addSubview:backButton];
    
    [self.view addSubview:imageSmileyView];
    
}

-(void)closeModal
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
