//
//  MBQuoteViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteViewController.h"
#import "MBTextView.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreData/CoreData.h>
#import <Social/Social.h>
#import "MBNoConnectionViewController.h"
#import "MBLoadingView.h"
#import "MBQuoteView.h"
#import "CoreFoundation/CoreFoundation.h"

#define kDefaultFontSize  50.0

@implementation MBQuoteViewController

MBLoadingView *loadingView;
MBQuoteView *quoteView;
NSTimer *timer;
NSString *_quoteID;
BOOL _liked;

-(void) loadView
{
    [super viewDidLoad];
    
    quoteLoaded = NO;
    
    [self initiateConnection];
    
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    self.view.backgroundColor = [_color colorWithAlphaComponent:0.92];
    
    UILabel *topLabel = [UILabel new];
    
    NSMutableAttributedString *attributedString;
    NSString *dontBe = [NSString stringWithFormat:@"don't be %@.", self.mood];
    attributedString = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(dontBe, nil) uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString.length)];
    [topLabel setAttributedText:attributedString];
    
    topLabel.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:32/2];    
    topLabel.textColor = [UIColor colorWithRed:246.0 green:246.0 blue:246.0 alpha:1];
    topLabel.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    topLabel.frame = CGRectMake(0, 0, 320, 146/2);
    topLabel.textAlignment = NSTextAlignmentCenter;
    

    UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 3)];
        
    //shape layer for the line
    CAShapeLayer *line = [CAShapeLayer layer];
    line.path = [linePath CGPath];
    line.fillColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3].CGColor;
    line.frame = CGRectMake(0, 146/2, 320, 5);
    
    UIButton *backButton;
    UIButton *shareFacebook;
    UIButton *shareTwitter;
    
    UIBezierPath *linePath2;
    CAShapeLayer *line2;
    
    UIBezierPath *linePath3;
    CAShapeLayer *line3;
    
    UIBezierPath *linePath4;
    CAShapeLayer *line4;
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    line2 = [CAShapeLayer layer];
    line2.path = [linePath2 CGPath];
    line2.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
    
    linePath3 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 1, 146/2)];
    line3 = [CAShapeLayer layer];
    line3.path = [linePath3 CGPath];
    line3.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
    
    linePath4 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 1, 146/2)];
    line4 = [CAShapeLayer layer];
    line4.path = [linePath4 CGPath];
    line4.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            line2.frame = CGRectMake(0, 500, 320, 1);
            line3.frame = CGRectMake(106.6, 500, 1, 146/2);
            line4.frame = CGRectMake(213.2, 500, 1, 146/2);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, 106.6, 146/2)];
            shareFacebook = [[UIButton alloc] initWithFrame:CGRectMake(106.6, 500, 106.6, 146/2)];
            shareTwitter = [[UIButton alloc] initWithFrame:CGRectMake(213.2, 500, 106.6, 146/2)];
        } else {
            line2.frame = CGRectMake(0, 410, 320, 1);
            line3.frame = CGRectMake(106.6, 410, 1, 146/2);
            line4.frame = CGRectMake(213.2, 410, 1, 146/2);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 410, 106.6, 146/2)];
            shareFacebook = [[UIButton alloc] initWithFrame:CGRectMake(106.6, 410, 106.6, 146/2)];
            shareTwitter = [[UIButton alloc] initWithFrame:CGRectMake(213.2, 410, 106.6, 146/2)];
        }
    }

    NSMutableAttributedString *attributedString4;
    attributedString4 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Back", nil) uppercaseString]];
    [attributedString4 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString4.length)];
    
    [backButton setAttributedTitle:attributedString4 forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchDown];
    [backButton setValue:[UIFont fontWithName:@"SourceSansPro-Regular" size:36/2] forKey:@"font"];
    backButton.titleLabel.textColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    
    NSMutableAttributedString *attributedString5;
    attributedString5 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Share to Facebook", nil) uppercaseString]];
    [attributedString5 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString5.length)];
    
    [shareFacebook setAttributedTitle:attributedString5 forState:UIControlStateNormal];
    [shareFacebook addTarget:self action:@selector(shareToFacebook) forControlEvents:UIControlEventTouchDown];
    [shareFacebook setValue:[UIFont fontWithName:@"SourceSansPro-Regular" size:14] forKey:@"font"];
    shareFacebook.titleLabel.textColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    shareFacebook.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    shareFacebook.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *attributedString6;
    attributedString6 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Share to Twitter", nil) uppercaseString]];
    [attributedString6 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString6.length)];
    
    [shareTwitter setAttributedTitle:attributedString6 forState:UIControlStateNormal];
    [shareTwitter addTarget:self action:@selector(shareToTwitter) forControlEvents:UIControlEventTouchDown];
    [shareTwitter setValue:[UIFont fontWithName:@"SourceSansPro-Regular" size:14] forKey:@"font"];
    shareTwitter.titleLabel.textColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    shareTwitter.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    shareTwitter.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reloadQuote:)];
    swipeGesture.numberOfTouchesRequired = 1;
    swipeGesture.direction = (UISwipeGestureRecognizerDirectionLeft);
    [self.view addGestureRecognizer:swipeGesture];
    
    [self.view addSubview:topLabel];
    [self.view.layer addSublayer:line];
    
    [self.view.layer addSublayer:line2];
    [self.view.layer addSublayer:line3];
    [self.view.layer addSublayer:line4];
    
    [self.view addSubview:backButton];
    [self.view addSubview:shareFacebook];
    [self.view addSubview:shareTwitter];
    
}

- (void) initiateConnection
{
    NSString *lang = [[[NSLocale preferredLanguages] objectAtIndex:0] lowercaseString];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *cfuuid = [prefs stringForKey:@"cfuuid"];
    
    NSString *connectionUrl = [NSString stringWithFormat:@"http://www.halffullapp.com/quote/%@/%@/%@/", self.mood, lang, cfuuid];
    
    NSURL *url = [NSURL URLWithString:connectionUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                            timeoutInterval:30];
    if ( connection ) {
        connection = nil;
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:YES];

}

- (void) reloadQuote:(UISwipeGestureRecognizer*)swipeGesture
{
    if ( quoteLoaded ) {
        [quoteView removeFromSuperview];
        [self initiateConnection];
        quoteLoaded = NO;
    }
}

-(void)viewWillLayoutSubviews {
    CGSize screenSize = [UIScreen mainScreen].applicationFrame.size;

    
    if ( quoteLoaded ) {
        
        quoteView = [[MBQuoteView alloc] initWithFrame:CGRectMake(0.0, 0, screenSize.width, screenSize.height - 146)];
        [quoteView setQuote:quote];
        [quoteView setQuoted:quoted];
        [quoteView setQuoteID:_quoteID];
        [quoteView setLiked:_liked];
        
        if ( timer ) {
            [timer invalidate];
        }
        
        [loadingView removeFromSuperview];
        [self.view addSubview:quoteView];
        
    } else {
        quoteLoaded = NO;
        if ( loadingView ) {
            loadingView = nil;
        }
        loadingView = [[MBLoadingView alloc] initWithFrame:CGRectMake(0, 20, 30.0, 30.0)];
        
        [self.view addSubview:loadingView];
    }
}

-(void)showNoConnectionView
{
    [connection cancel];
    MBNoConnectionViewController *noConnection = [MBNoConnectionViewController new];
    noConnection.delegate = self;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    [self.view.window.layer addAnimation:transition forKey:nil];
    
    [self presentViewController:noConnection animated:NO completion:nil];
}

-(void)closeModal
{
    [connection cancel];
    [timer invalidate];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)shareToFacebook
{
    if ( !quoteLoaded ) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:NSLocalizedString(@"Whoops", nil)
                                  message:NSLocalizedString(@"The quote hasn't loaded yet.", nil)
                                  delegate:nil
                                  cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                  otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    NSString *formattedQuote = [NSString stringWithFormat:@"\"%@\" - %@", moodInfo[1], moodInfo[2]];
    

    SLComposeViewController *facebookSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebookSheet setInitialText:formattedQuote];
    [self presentViewController:facebookSheet animated:YES completion:nil];
}

-(void)shareToTwitter
{
    if ( !quoteLoaded ) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:NSLocalizedString(@"Whoops", nil)
                                  message:NSLocalizedString(@"The quote hasn't loaded yet.", nil)
                                  delegate:nil
                                  cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                  otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    NSString *quoteWithQuoted = [NSString stringWithFormat:@"\"%@\" - %@", moodInfo[1], moodInfo[2]];
    
    if ( quoteWithQuoted.length > 140 ) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                 initWithTitle:NSLocalizedString(@"Whoops", nil)
                                 message:NSLocalizedString(@"Sorry, this quote is too long to post to Twitter.", nil)
                                 delegate:nil
                                 cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                 otherButtonTitles:nil, nil];
        [alertView show];
    } 
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetSheet setInitialText:quoteWithQuoted];
    [self presentViewController:tweetSheet animated:YES completion:nil];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (!responseData) {
        responseData = [[NSMutableData alloc] init];
    }
    [responseData appendData:data];
    [timer invalidate];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self showNoConnectionView];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSError *error;
    NSArray* dictionary = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    NSDictionary *fields;
    if ( [dictionary count] > 0 ) {
        fields = [dictionary[0] objectForKey:@"fields"];
    } else {
        [self showNoConnectionView];
        return;
    }
    
    moodInfo = @[self.mood, [fields objectForKey:@"quote"], [fields objectForKey:@"attribution"], self.color];
    quoteLoaded = YES;
    
    _quoteID = [dictionary[0] objectForKey:@"pk"];
    _liked = [dictionary count] == 2;
    
    quote = moodInfo[1];
    quoted = moodInfo[2];
    
    [self.view setNeedsLayout];
}

- (void) restartConnection
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
