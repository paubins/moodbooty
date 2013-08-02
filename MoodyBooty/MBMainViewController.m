//
//  MBMainViewController.m
//  MoodyBooty
//
//  Created by paubins on 8/1/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBMainViewController.h"
#import "MBQuoteMoodViewController.h"

@implementation MBMainViewController

-(void)loadView
{

}

- (void) viewDidLoad
{
    MBQuoteMoodViewController *mb = [MBQuoteMoodViewController new];
    
    [self presentViewController:mb animated:YES completion:nil];
}

@end
