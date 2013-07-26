//
//  MBQuoteViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteViewController.h"
#import "MBQuotevIew.h"
#import <QuartzCore/QuartzCore.h>

@implementation MBQuoteViewController

-(void) loadView
{
    [super viewDidLoad];
    
    self.view = [[MBQuoteView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height)];
    
    self.view.backgroundColor = [UIColor colorWithRed:232.0/255.0 green:92.0/255.0 blue:65.0/255.0 alpha:1];
    
    UILabel *topLabel = [UILabel new];
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[@"Chillll" uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString.length)];
    [topLabel setAttributedText:attributedString];
    
    topLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];
    topLabel.shadowColor = [UIColor blackColor];
    topLabel.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    topLabel.textColor = [UIColor colorWithRed:246.0 green:246.0 blue:246.0 alpha:1];
    topLabel.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    topLabel.frame = CGRectMake(0, 0, 320, 120/2);
    topLabel.textAlignment = NSTextAlignmentCenter;
    
    UIImage *image = [UIImage imageNamed:@"smiley.png"];
    

    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = CGRectMake(0, 50, 320, 100);
    imageView.contentMode = UIViewContentModeCenter;

    
    UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 3)];
    
    //shape layer for the line
    CAShapeLayer *line = [CAShapeLayer layer];
    line.path = [linePath CGPath];
    line.fillColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3].CGColor;
    line.frame = CGRectMake(0, 120/2, 320, 5);
    
    UILabel *label = [UILabel new];
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:@"This is a quote text string. This is a quote text string.This is a quote text string.This is a quote text string.This is a quote text string."];
    [attributedString2 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString2.length)];
    [label setAttributedText:attributedString2];
    
    label.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:46/2];
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(35, 150, 250, 230);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];

    
    UILabel *bottomLabel = [UILabel new];
    
    NSMutableAttributedString *attributedString3;
    attributedString3 = [[NSMutableAttributedString alloc] initWithString:[@"Be Happy" uppercaseString]];
    [attributedString3 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString3.length)];
    [bottomLabel setAttributedText:attributedString3];
    
    bottomLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];
    bottomLabel.shadowColor = [UIColor blackColor];
    bottomLabel.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    bottomLabel.textColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    bottomLabel.frame = CGRectMake(0, 380, 320, 80);
    bottomLabel.backgroundColor = [UIColor clearColor];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self.view addSubview:topLabel];
    [self.view.layer addSublayer:line];
    [self.view addSubview:imageView];
    [self.view addSubview:label];
    [self.view addSubview:bottomLabel];
    
}



@end
