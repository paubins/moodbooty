//
//  MBNoConnectionViewController.h
//  MoodyBooty
//
//  Created by paubins on 8/16/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MBNoConnectionViewControllerDelegate;

@interface MBNoConnectionViewController : UIViewController

@property (nonatomic, weak) id<MBNoConnectionViewControllerDelegate> delegate;

- (void)restartConnection;

@end

@protocol MBNoConnectionViewControllerDelegate <NSObject>

- (void)childViewController:(MBNoConnectionViewController *)viewController;

@end