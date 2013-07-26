//
//  MBQuoteMoodViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteMoodViewController.h"
#import "MBQuoteCollectionViewController.h"
#import "MBQuoteCollectionViewCell.h"
#import "MBQuoteUICollectionViewLayout.h"
#import "MBAboutViewController.h"
#import "MBQuoteViewController.h"
#import "MBQUoteView.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@implementation MBQuoteMoodViewController

- (void)loadView
{
    [super loadView];
    
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    MBQuoteUICollectionViewLayout *collectionViewLayout = [MBQuoteUICollectionViewLayout new];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 120/2)];
    
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[@"How ya feeling today?" uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString.length)];
    [topLabel setAttributedText:attributedString];
    
    topLabel.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    topLabel.textColor = [UIColor whiteColor];
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];
    topLabel.shadowColor = [UIColor blackColor];
    topLabel.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 3)];
    
    //shape layer for the line
    CAShapeLayer *line = [CAShapeLayer layer];
    line.path = [linePath CGPath];
    line.fillColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3].CGColor;
    line.frame = CGRectMake(0, 120/2, 320, 5);
    
    
    NSArray *moods = @[
                       @[@"angry", [UIColor colorWithRed:232.0/255.0 green:92.0/255.0 blue:65.0/255.0 alpha:1]], // red
                       @[@"impatient", [UIColor colorWithRed:115.0/255.0 green:208.0/255.0 blue:181.0/255.0 alpha:1]], // teal
                       @[@"anxious", [UIColor colorWithRed:92.0/255.0 green:106.0/255.0 blue:136.0/255.0 alpha:1]], // purple
                       @[@"lonely", [UIColor colorWithRed:82.0/255.0 green:186.0/255.0 blue:213.0/255.0 alpha:1]], // blue
                       @[@"depressed", [UIColor colorWithRed:146.0/255.0 green:139.0/255.0 blue:137.0/255.0 alpha:1]], // brown
                       @[@"tired", [UIColor colorWithRed:190.0/255.0 green:179.0/255.0 blue:162.0/255.0 alpha:1]], // light brown
                       @[@"sad", [UIColor colorWithRed:254.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1]], // golden yellow
                       @[@"nostalgic", [UIColor colorWithRed:251.0/255.0 green:161.0/255.0 blue:125.0/255.0 alpha:1]], // pink
                       @[@"jealous", [UIColor colorWithRed:131.0/255.0 green:136.0/255.0 blue:92.0/255.0 alpha:1]], // pink
                       ];

    
    NSInteger i = 0;
    NSInteger j = 0;
    NSInteger k = 0;
    
    for ( NSArray *array in moods )
    {
        NSString *mood = array[0];
        UIColor *color = array[1];
        
        UIImage *image = [UIImage imageNamed:mood];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
      
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5 + (i*106), 120/2 + (j*106) + 15 , 100, 100)];
        button.backgroundColor = color;
        button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        
        [button setTitle:mood forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addSubview:imageView];
        [button addTarget:self action:@selector(openModel:) forControlEvents:UIControlEventTouchDown];
        [button setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:36/2] forKey:@"font"];
        //[button setTitleEdgeInsets:<#(UIEdgeInsets)#>]
        
        
        button.tag = k;
        
        [self.view addSubview:button];
        
        if ( i == 2 ){
            i = 0;
            j++;
        } else {
            i++;
        }
        k++;
    }

    UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,400,320, 120/2)];
    bottomLabel.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    bottomLabel.textColor = [UIColor whiteColor];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];
    bottomLabel.shadowColor = [UIColor blackColor];
    bottomLabel.shadowOffset = CGSizeMake(-0.5, 0.5);
    bottomLabel.userInteractionEnabled = YES;
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:[@"Think half full." uppercaseString]];
    [attributedString2 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString2.length)];
    [bottomLabel setAttributedText:attributedString2];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture)];
    [bottomLabel addGestureRecognizer:recognizer];
    
    [self.view addSubview:topLabel];
    [self.view.layer addSublayer:line];
    [self.view addSubview:bottomLabel];
}

- (void) handleGesture
{
    UIViewController *controller = [MBAboutViewController new];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void) openModel:(UIButton *)sender
{

    MBQuoteViewController *controller = [MBQuoteViewController new];
    [controller setMood:sender.tag];
    
    [self presentViewController:controller animated:NO completion:nil];
}


@end