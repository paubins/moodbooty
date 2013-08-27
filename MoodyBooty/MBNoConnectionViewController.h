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



@end

@protocol MBNoConnectionViewControllerDelegate <NSObject>

- (void)restartConnection;

@end