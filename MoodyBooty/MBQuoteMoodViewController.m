//
//  MBQuoteMoodViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteMoodViewController.h"
#import "MBAboutViewController.h"
#import "MBQuoteViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@implementation MBQuoteMoodViewController


- (void)loadView
{
    [super loadView];
    
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 146/2)];
    
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"How ya feeling today?", nil) uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString.length)];
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
    line.frame = CGRectMake(0, 146/2, 320, 5);
    
    
    self.moods = @[
                       @[@"angry", [UIColor colorWithRed:232.0/255.0 green:92.0/255.0 blue:65.0/255.0 alpha:1]], // red
                       @[@"impatient", [UIColor colorWithRed:115.0/255.0 green:208.0/255.0 blue:181.0/255.0 alpha:1]], // teal
                       @[@"tired", [UIColor colorWithRed:92.0/255.0 green:106.0/255.0 blue:136.0/255.0 alpha:1]], // light brown
                       
                       @[@"lonely", [UIColor colorWithRed:82.0/255.0 green:186.0/255.0 blue:213.0/255.0 alpha:1]], // blue
                       @[@"depressed", [UIColor colorWithRed:146.0/255.0 green:139.0/255.0 blue:137.0/255.0 alpha:1]], // brown
                       @[@"guilty", [UIColor colorWithRed:148.0/255.0 green:62.0/255.0 blue:70.0/255.0 alpha:1]], // pink
                       
                       @[@"sad", [UIColor colorWithRed:254.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1]], // golden yellow
                       @[@"nostalgic", [UIColor colorWithRed:251.0/255.0 green:161.0/255.0 blue:125.0/255.0 alpha:1]], // pink
                       @[@"jealous", [UIColor colorWithRed:131.0/255.0 green:136.0/255.0 blue:92.0/255.0 alpha:1]], // pink
                       
                       @[@"dull", [UIColor colorWithRed:141.0/255.0 green:115.0/255.0 blue:148.0/255.0 alpha:1]], // pink
                       @[@"scared", [UIColor colorWithRed:130.0/255.0 green:93.0/255.0 blue:73.0/255.0 alpha:1]], // pink
                       @[@"anxious", [UIColor colorWithRed:190.0/255.0 green:179.0/255.0 blue:162.0/255.0 alpha:1]], // purple
                       ];

    
    NSInteger i = 0;
    NSInteger j = 0;
    NSInteger k = 0;
    NSInteger b = 0;
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenHeight = screenSize.height;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 147/2, 106.7*3, screenHeight - 158)];
    [scrollView setContentSize:CGSizeMake(106.7*3, 106.7*4)];
    [scrollView setBounces:NO];
    
    for ( NSArray *array in self.moods )
    {
        NSString *mood = NSLocalizedString(array[0], nil);
        UIColor *color = array[1];
        
        UIImage *image = [UIImage imageNamed:array[0]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
      
        if ( i == 2 ) {
            b++;
        }
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((i*106.7), (j*106) , 106.7, 106.7)];
        button.backgroundColor = color;
        button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        button.titleEdgeInsets = UIEdgeInsetsMake(10, 5, 10, 5);
        
        [button setTitle:mood forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addSubview:imageView];
        [button addTarget:self action:@selector(openModel:) forControlEvents:UIControlEventTouchDown];
        [button setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:36/2] forKey:@"font"];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        
        button.tag = k;
        
        [scrollView addSubview:button];
        
        if ( i == 2 ){
            i = 0;
            b = 0;  
            j++;
        } else {
            i++;
        }
        k++;
    }
    
    [self.view addSubview:scrollView];

    
    UILabel *bottomLabel;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,480, 320, 146/2)];
            
            for ( int i = 0; i < 3; i++ ) {
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((i*106.7), 147/2 + (j*106) , 106.7, 100)];
                if ( i == 1 ){
                    button.backgroundColor = [UIColor darkGrayColor];
                } else {
                    button.backgroundColor = [UIColor grayColor];
                }
                
                button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
                button.titleEdgeInsets = UIEdgeInsetsMake(10, 5, 10, 5);
                
                [self.view addSubview:button];
            }
        } else {
            bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 390, 320, 146/2)];
        }
    }
    
    bottomLabel.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    bottomLabel.textColor = [UIColor whiteColor];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];
    bottomLabel.shadowColor = [UIColor blackColor];
    bottomLabel.shadowOffset = CGSizeMake(-0.5, 0.5);
    bottomLabel.userInteractionEnabled = YES;
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Live half full.", nil) uppercaseString]];
    [attributedString2 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString2.length)];
    [bottomLabel setAttributedText:attributedString2];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture)];
    [bottomLabel addGestureRecognizer:recognizer];
    
    [self.view addSubview:topLabel];
    [self.view.layer addSublayer:line];
    [self.view addSubview:bottomLabel];
}

- (void) viewWillAppear:(BOOL)animated
{
    
    //[self setModalTransitionStyle:UIMOdalTransi];
    //[self setModalPresentationStyle:UIModalPre];
    self.definesPresentationContext = YES;
    self.providesPresentationContextTransitionStyle = YES;
    
}

- (void) viewDidAppear:(BOOL)animated
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if ( ![prefs boolForKey:@"aboutShown"] ){
        MBAboutViewController *aboutViewController = [MBAboutViewController new];
        
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromTop;
        [self.view.window.layer addAnimation:transition forKey:nil];
    
        [self presentViewController:aboutViewController animated:YES completion:nil];
        [prefs setBool:YES forKey:@"aboutShown"];
        [prefs synchronize];
    }
}

- (void) handleGesture
{
    MBAboutViewController *controller = [MBAboutViewController new];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    [self.view.window.layer addAnimation:transition forKey:nil];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void) openModel:(UIButton *)sender
{
    
    MBQuoteViewController *controller = [MBQuoteViewController new];
    [controller setMood:self.moods[sender.tag][0]];
    [controller setColor:self.moods[sender.tag][1]];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    [self.view.window.layer addAnimation:transition forKey:nil];
    
    
    [self presentViewController:controller animated:YES completion:nil];
}


@end
