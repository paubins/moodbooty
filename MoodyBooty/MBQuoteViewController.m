//
//  MBQuoteViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation MBQuoteViewController

-(void) loadView
{
    [super viewDidLoad];
    
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    self.view.backgroundColor = [UIColor colorWithRed:232.0/255.0 green:92.0/255.0 blue:65.0/255.0 alpha:1];
    
    UILabel *topLabel = [UILabel new];
    topLabel.text = [@"Chillll" uppercaseString];
    topLabel.textColor = [UIColor colorWithRed:246.0 green:246.0 blue:246.0 alpha:1];
    topLabel.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    topLabel.frame = CGRectMake(0, 0, 320, 50);
    topLabel.textAlignment = NSTextAlignmentCenter;
    
    UIImage *image = [UIImage imageNamed:@"smiley.png"];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 320, 100)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = image;
    imageView.contentMode = UIViewContentModeCenter;
//    imageView.layer.borderColor = [UIColor greenColor].CGColor;
//    imageView.layer.borderWidth = 3.0;
    
    UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 3)];
    
    //shape layer for the line
    CAShapeLayer *line = [CAShapeLayer layer];
    line.path = [linePath CGPath];
    line.fillColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3].CGColor;
    line.frame = CGRectMake(0, 50, 320, 5);
    
    UILabel *label = [UILabel new];
    label.text = @"This is a quote text string. This is a quote text string.This is a quote text string.This is a quote text string.This is a quote text string.";
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(10, 150, 300, 230);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
//    label.layer.borderColor = [UIColor greenColor].CGColor;
//    label.layer.borderWidth = 3.0;
    
    [label setFont:[UIFont fontWithName:@"ArialMT" size:23]];
    
    UILabel *bottomLabel = [UILabel new];
    bottomLabel.text = [@"Be Happy" uppercaseString];
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
