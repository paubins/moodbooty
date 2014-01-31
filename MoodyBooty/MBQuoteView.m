//
//  MBQuoteView.m
//  MoodyBooty
//
//  Created by paubins on 8/18/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteView.h"
#import "MBTextView.h"
#import "CoreFoundation/CoreFoundation.h"

#define kDefaultFontSize  50.0

@implementation MBQuoteView

UIImageView *_smileyImageView;
NSMutableData *_responseData;
NSURLConnection *_connection;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews
{
    UIImage *image = [UIImage imageNamed:@"Smiley_2"];
    
    UILabel *attributedTo;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    MBTextView *label = [[MBTextView alloc] initWithFrame:CGRectMake(35, 160, 250, 170)];
    
    _smileyImageView= [[UIImageView alloc] initWithImage:image];
    _smileyImageView.frame = CGRectMake(320/2 - ceil(image.size.width/2), 105, image.size.width, image.size.height);
    _smileyImageView.contentMode = UIViewContentModeCenter;
    _smileyImageView.alpha = _liked ? 1.0f : 0.5f;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isCathartic:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    
    [_smileyImageView addGestureRecognizer:singleTap];
    [_smileyImageView setUserInteractionEnabled:YES];
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\u201C%@\u201D", self.quote]];
    [attributedString2 addAttribute:NSKernAttributeName value:@0 range:NSMakeRange(0, attributedString2.length)];
    [label setAttributedText:attributedString2];
    
    label.scrollEnabled = NO;
    label.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:kDefaultFontSize];
    
    NSDictionary *attributes = @{NSFontAttributeName: label.font};
    CGRect fontRect = [label.text boundingRectWithSize:CGSizeMake(230, MAXFLOAT)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil];
    CGSize fontSize = fontRect.size;
    
    if (fontSize.height > 150) {
        int newFontSize = kDefaultFontSize;
        while (fontSize.height >= 150 || fontSize.width > 250 ) {
            UIFont *font = [UIFont fontWithName:@"SourceSansPro-Regular" size:newFontSize--];
            label.font = font;
            
            NSDictionary *attributes = @{NSFontAttributeName: font};
            CGRect fontRect = [label.text boundingRectWithSize:CGSizeMake(230, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:attributes
                                                       context:nil];
            fontSize = fontRect.size;
        }
    }
    
    
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.editable = NO;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            attributedTo = [[UILabel alloc] initWithFrame:CGRectMake(0, 340, 320, 40)];
        } else {
            attributedTo = [[UILabel alloc] initWithFrame:CGRectMake(0, 320, 320, 40)];
        }
    }
    
    attributedTo.backgroundColor = [UIColor clearColor];
    attributedTo.textAlignment = NSTextAlignmentCenter;
    attributedTo.textColor = [UIColor whiteColor];
    [attributedTo setFont:[UIFont fontWithName:@"SourceSansPro-Regular" size:16]];
    
    NSMutableAttributedString *attributedString3;
    attributedString3 = [[NSMutableAttributedString alloc] initWithString:[self.quoted uppercaseString]];
    [attributedString3 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString3.length)];
    
    [attributedTo setAttributedText:attributedString3];
    
    [self addSubview:_smileyImageView];
    [self addSubview:label];
    [self addSubview:attributedTo];
}

- (void)isCathartic:(UIGestureRecognizer *)gestureRecognizer {
    
    [UIView animateWithDuration:0.5 animations:^(void){
        if (_smileyImageView.alpha == 1.0f) {
            _smileyImageView.alpha = 0.5f;
        } else {
            _smileyImageView.alpha = 1.0f;
        }
    }];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *cfuuid = [prefs stringForKey:@"cfuuid"];
    
    NSString *connectionUrl = @"http://www.halffullapp.com/like/";
    
    NSURL *url = [NSURL URLWithString:connectionUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                            timeoutInterval:30];

    NSString *postData = [NSString stringWithFormat:@"quote_id=%@&uuid=%@&like=%d", _quoteID, cfuuid, !_liked];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (!_responseData) {
        _responseData = [[NSMutableData alloc] init];
    }
    [_responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSError *error;
    NSArray* dictionary = [NSJSONSerialization JSONObjectWithData:_responseData options:kNilOptions error:&error];
    
    NSDictionary *fields;
    if ( [dictionary count] > 0 ) {
        fields = [dictionary[0] objectForKey:@"fields"];
    } else {
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
