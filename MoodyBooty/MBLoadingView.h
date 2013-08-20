//
//  MBLoadingView.h
//  MoodyBooty
//
//  Created by paubins on 8/16/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBLoadingView : UIView

@property (nonatomic, readonly) UIImageView *circle;
@property (nonatomic, readonly) UIImageView *circle2;
@property (nonatomic, readonly) UIImageView *circle3;

@property (nonatomic, readonly) UIImageView *emptyCircle;
@property (nonatomic, readonly) UIImageView *emptyCircle2;
@property (nonatomic, readonly) UIImageView *emptyCircle3;

@property (nonatomic, readonly) NSTimer *timer;

@property (nonatomic, readonly) NSInteger off;

@end
