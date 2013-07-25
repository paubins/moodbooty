//
//  MBMood.h
//  MoodyBooty
//
//  Created by paubins on 7/24/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface MBMood : NSManagedObject

@property NSString *mood;
@property NSString *oppositeMood;

@end
