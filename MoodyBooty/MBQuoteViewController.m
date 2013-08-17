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

#define kDefaultFontSize  50.0

@implementation MBQuoteViewController

MBLoadingView *loadingView;
NSTimer *timer;

-(void) loadView
{
    [super viewDidLoad];
    
    quoteLoaded = NO;
    
    NSString *lang = [[[NSLocale preferredLanguages] objectAtIndex:0] lowercaseString];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.halffullapp.com/quote/%@/%@/", self.mood, lang]];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    
    connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:YES];
    
    
    
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height)];
    
    self.view.backgroundColor = _color;
    
    UILabel *topLabel = [UILabel new];
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[[NSString stringWithFormat:NSLocalizedString(@"don't be %@.", nil), self.mood] uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString.length)];
    [topLabel setAttributedText:attributedString];
    
    topLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];    
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
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
            line2 = [CAShapeLayer layer];
            line2.path = [linePath2 CGPath];
            line2.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line2.frame = CGRectMake(0, 480, 320, 1);
            
            linePath3 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 1, 146/2)];
            line3 = [CAShapeLayer layer];
            line3.path = [linePath3 CGPath];
            line3.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line3.frame = CGRectMake(106.6, 480, 1, 146/2);
            
            linePath4 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 1, 146/2)];
            line4 = [CAShapeLayer layer];
            line4.path = [linePath4 CGPath];
            line4.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line4.frame = CGRectMake(213.2, 480, 1, 146/2);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 480, 106.6, 146/2)];
            shareFacebook = [[UIButton alloc] initWithFrame:CGRectMake(106.6, 480, 106.6, 146/2)];
            shareTwitter = [[UIButton alloc] initWithFrame:CGRectMake(213.2, 480, 106.6, 146/2)];
        } else {
            linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
            
            //shape layer for the line
            line2 = [CAShapeLayer layer];
            line2.path = [linePath2 CGPath];
            line2.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line2.frame = CGRectMake(0, 390, 320, 1);
            
            linePath3 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 1, 146/2)];
            line3 = [CAShapeLayer layer];
            line3.path = [linePath3 CGPath];
            line3.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line3.frame = CGRectMake(106.6, 390, 1, 146/2);
            
            linePath4 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 1, 146/2)];
            line4 = [CAShapeLayer layer];
            line4.path = [linePath4 CGPath];
            line4.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line4.frame = CGRectMake(213.2, 390, 1, 146/2);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 390, 106.6, 146/2)];
            shareFacebook = [[UIButton alloc] initWithFrame:CGRectMake(106.6, 390, 106.6, 146/2)];
            shareTwitter = [[UIButton alloc] initWithFrame:CGRectMake(213.2, 390, 106.6, 146/2)];
        }
    }

    NSMutableAttributedString *attributedString4;
    attributedString4 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Back", nil) uppercaseString]];
    [attributedString4 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString4.length)];
    
    [backButton setAttributedTitle:attributedString4 forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchDown];
    [backButton setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:36/2] forKey:@"font"];
    backButton.titleLabel.textColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    
    
    
    NSMutableAttributedString *attributedString5;
    attributedString5 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Share to \nFacebook", nil) uppercaseString]];
    [attributedString5 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString5.length)];
    
    [shareFacebook setAttributedTitle:attributedString5 forState:UIControlStateNormal];
    [shareFacebook addTarget:self action:@selector(shareToFacebook) forControlEvents:UIControlEventTouchDown];
    [shareFacebook setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:14] forKey:@"font"];
    shareFacebook.titleLabel.textColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    shareFacebook.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    shareFacebook.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *attributedString6;
    attributedString6 = [[NSMutableAttributedString alloc] initWithString:[NSLocalizedString(@"Share to \nTwitter", nil) uppercaseString]];
    [attributedString6 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString6.length)];
    
    [shareTwitter setAttributedTitle:attributedString6 forState:UIControlStateNormal];
    [shareTwitter addTarget:self action:@selector(shareToTwitter) forControlEvents:UIControlEventTouchDown];
    [shareTwitter setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:14] forKey:@"font"];
    shareTwitter.titleLabel.textColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    shareTwitter.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    shareTwitter.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:topLabel];
    [self.view.layer addSublayer:line];
    
    [self.view.layer addSublayer:line2];
    [self.view.layer addSublayer:line3];
    [self.view.layer addSublayer:line4];
    
    [self.view addSubview:backButton];
    [self.view addSubview:shareFacebook];
    [self.view addSubview:shareTwitter];
    
}

-(void)viewWillLayoutSubviews {
    UITextView *attributedTo;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    MBTextView *label = [[MBTextView alloc] initWithFrame:CGRectMake(35, 160, 250, 150)];
    
    if ( quoteLoaded ) {
        UIImage *image = [UIImage imageNamed:@"Smiley_2"];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(320/2 - ceil(image.size.width/2), 105, image.size.width, image.size.height);
        imageView.contentMode = UIViewContentModeCenter;
        
        
        NSMutableAttributedString *attributedString2;
        attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\u201C%@\u201D",quote]];
        [attributedString2 addAttribute:NSKernAttributeName value:@0 range:NSMakeRange(0, attributedString2.length)];
        [label setAttributedText:attributedString2];
        
        label.scrollEnabled = NO;
        label.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:kDefaultFontSize];
        
        CGSize fontSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(230,9999)];
        
        if (fontSize.height > 150) {
            int newFontSize = kDefaultFontSize;
            while (fontSize.height >= 150 || fontSize.width > 250 ) {
                label.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:newFontSize--];
                fontSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(230,9999)];
            }
        }
        
        
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        label.editable = NO;

        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if (screenSize.height > 480.0f) {
                attributedTo = [[UITextView alloc] initWithFrame:CGRectMake(0, 340, 320, 40)];
            } else {
                attributedTo = [[UITextView alloc] initWithFrame:CGRectMake(0, 320, 320, 40)];
            }
        }
        attributedTo.editable = NO;
        attributedTo.backgroundColor = [UIColor clearColor];
        attributedTo.textAlignment = NSTextAlignmentCenter;
        attributedTo.textColor = [UIColor whiteColor];
        attributedTo.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:16];
        
        NSMutableAttributedString *attributedString3;
        attributedString3 = [[NSMutableAttributedString alloc] initWithString:[quoted uppercaseString]];
        [attributedString3 addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString3.length)];
        
        [attributedTo setAttributedText:attributedString3];
        
        quoteLoaded = NO;
        if ( timer ) {
            [timer invalidate];
        }
        
        [loadingView removeFromSuperview];
        [self.view addSubview:imageView];
        [self.view addSubview:label];
        [self.view addSubview:attributedTo];
        
    } else {
        quoteLoaded = NO;
        loadingView = [[MBLoadingView alloc] initWithFrame:CGRectMake(0, 20, 30.0, 30.0)];
        
        [self.view addSubview:loadingView];
        timer = [NSTimer scheduledTimerWithTimeInterval:10.0
                                         target:self
                                       selector:@selector(showNoConnectionView:)
                                       userInfo:nil
                                        repeats:NO];
    }
}

-(void)showNoConnectionView:(NSTimer *)timer
{
    [connection cancel];
    MBNoConnectionViewController *noConnection = [MBNoConnectionViewController new];
    
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
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeFacebook];
        [tweetSheet setInitialText:formattedQuote];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
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
    NSString *quoteWithQuoted = [NSString stringWithFormat:@"\"%@\" - %@", quote, quoted];
    
    if ( quoteWithQuoted.length > 140 ) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                 initWithTitle:NSLocalizedString(@"Whoops", nil)
                                 message:NSLocalizedString(@"Sorry, this quote is too long to post to Twitter.", nil)
                                 delegate:nil
                                 cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                 otherButtonTitles:nil, nil];
        [alertView show];
    } else if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:quote];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
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

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    NSArray* dictionary = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    NSDictionary *fields = [dictionary[0] objectForKey:@"fields"];
    
    moodInfo = @[self.mood, [fields objectForKey:@"quote"], [fields objectForKey:@"attribution"], self.color];
    quoteLoaded = YES;
    
    quote = moodInfo[1];
    quoted = moodInfo[2];
    
    [self.view setNeedsLayout];
}

@end
