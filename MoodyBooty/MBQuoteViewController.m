//
//  MBQuoteViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteViewController.h"
#import "MBQuoteView.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreData/CoreData.h>

@implementation MBQuoteViewController

-(void) loadView
{
    
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
    
    
    NSArray *quotes = @[
                        @{
                            @"mood" : @"angry",
                            @"opposite" : @"happy",
                            @"quote" : @"hey butt"
                            },
                        @{
                            @"mood" : @"impatient",
                            @"opposite" : @"happy",
                            @"quote" : @"Hey dere this is a quote nooo."
                            },@{
                            @"mood" : @"anxious",
                            @"opposite" : @"happy",
                            @"quote" : @"Hey dere this is a quote nooo."
                            },
                        ];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(mood == %@)", moods[self.mood][0]];
    
    NSArray *filteredQuotes = [quotes filteredArrayUsingPredicate:predicate];
    NSString *quote = [[filteredQuotes objectAtIndex:0] objectForKey:@"quote"];
    NSString *oppositeMood = [[filteredQuotes objectAtIndex:0] objectForKey:@"opposite"];
    
    [super viewDidLoad];
    
    self.view = [[MBQuoteView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height)];
    
    self.view.backgroundColor = moods[self.mood][1];
    
    UILabel *topLabel = [UILabel new];
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[moods[self.mood][0] uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString.length)];
    [topLabel setAttributedText:attributedString];
    
    topLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];
    topLabel.shadowColor = [UIColor blackColor];
    topLabel.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    topLabel.textColor = [UIColor colorWithRed:246.0 green:246.0 blue:246.0 alpha:1];
    topLabel.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    topLabel.frame = CGRectMake(0, 0, 320, 120/2);
    topLabel.textAlignment = NSTextAlignmentCenter;
    
    UIImage *image = [UIImage imageNamed:@"Smiley_2"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(320/2 - ceil(image.size.width/2), 90, image.size.width, image.size.height);
    imageView.contentMode = UIViewContentModeCenter;

    
    UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 3)];
    
    //shape layer for the line
    CAShapeLayer *line = [CAShapeLayer layer];
    line.path = [linePath CGPath];
    line.fillColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3].CGColor;
    line.frame = CGRectMake(0, 120/2, 320, 5);
    
    UILabel *label = [UILabel new];
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:quote];
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
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 380, 320, 80)];
    [backButton setTitle:[@"Back" uppercaseString] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchDown];
    [backButton setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:36/2] forKey:@"font"];
    
//    [backButton ]
//    
//    NSMutableAttributedString *attributedString3;
//    attributedString3 = [[NSMutableAttributedString alloc] initWithString:[[NSString stringWithFormat:@"Be %@", oppositeMood] uppercaseString]];
//    [attributedString3 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString3.length)];
//    [bottomLabel setAttributedText:attributedString3];
//    
//    bottomLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];
//    bottomLabel.shadowColor = [UIColor blackColor];
//    bottomLabel.shadowOffset = CGSizeMake(-0.5, 0.5);
//    
//    bottomLabel.textColor = ;
//    bottomLabel.frame = CGRectMake(0, 380, 320, 80);
//    bottomLabel.backgroundColor = [UIColor clearColor];
//    bottomLabel.textAlignment = NSTextAlignmentCenter;
//    
    
    [self.view addSubview:topLabel];
    [self.view.layer addSublayer:line];
    [self.view addSubview:imageView];
    [self.view addSubview:label];
    [self.view addSubview:backButton];
    
}

-(void)closeModal
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
