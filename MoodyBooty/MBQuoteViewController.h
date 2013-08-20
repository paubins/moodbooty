//
//  MBQuoteViewController.h
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBNoConnectionViewController.h"

@interface MBQuoteViewController : UIViewController <UIGestureRecognizerDelegate, NSURLConnectionDelegate, MBNoConnectionViewControllerDelegate> {
    BOOL quoteLoaded;
    NSMutableData *responseData;
    NSArray *moodInfo;
    NSURLConnection *connection;
    
    NSString *quote;
    NSString *quoted;

}

@property NSString *mood;
@property UIColor *color;

@end
