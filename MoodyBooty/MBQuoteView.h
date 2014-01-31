//
//  MBQuoteView.h
//  MoodyBooty
//
//  Created by paubins on 8/18/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBQuoteView : UIView <NSURLConnectionDelegate>

@property NSString *quote;
@property NSString *quoted;
@property NSString *quoteID;
@property BOOL liked;

@end
