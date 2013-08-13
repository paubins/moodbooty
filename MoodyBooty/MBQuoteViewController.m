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

#define kDefaultFontSize  50.0

@implementation MBQuoteViewController


-(void) loadView
{
    
    NSArray *moodInfo = [self getMoodInfo];
    
    NSString *mood = moodInfo[0];
    NSString *quote = moodInfo[1];
    NSString *quoted = moodInfo[2];
    UIColor *color = moodInfo[3];
    
    [super viewDidLoad];
    
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height)];
    
    self.view.backgroundColor = color;
    
    UILabel *topLabel = [UILabel new];
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[[NSString stringWithFormat:NSLocalizedString(@"don't be %@.", nil), mood] uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@2.5 range:NSMakeRange(0, attributedString.length)];
    [topLabel setAttributedText:attributedString];
    
    topLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];    
    topLabel.textColor = [UIColor colorWithRed:246.0 green:246.0 blue:246.0 alpha:1];
    topLabel.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0];
    topLabel.frame = CGRectMake(0, 0, 320, 146/2);
    topLabel.textAlignment = NSTextAlignmentCenter;
    
    UIImage *image = [UIImage imageNamed:@"Smiley_2"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(320/2 - ceil(image.size.width/2), 105, image.size.width, image.size.height);
    imageView.contentMode = UIViewContentModeCenter;

    UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 3)];
        
    //shape layer for the line
    CAShapeLayer *line = [CAShapeLayer layer];
    line.path = [linePath CGPath];
    line.fillColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3].CGColor;
    line.frame = CGRectMake(0, 146/2, 320, 5);
    
    MBTextView *label = [[MBTextView alloc] initWithFrame:CGRectMake(35, 160, 250, 150)];
    
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

    
    UIButton *backButton;
    UIButton *shareFacebook;
    UIButton *shareTwitter;
    
    UIBezierPath *linePath2;
    CAShapeLayer *line2;
    
    UIBezierPath *linePath3;
    CAShapeLayer *line3;
    
    UIBezierPath *linePath4;
    CAShapeLayer *line4;
    
    UITextView *attributedTo;
    
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
            
            attributedTo = [[UITextView alloc] initWithFrame:CGRectMake(0, 340, 320, 40)];
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
    [self.view addSubview:imageView];
    [self.view addSubview:label];
    [self.view addSubview:attributedTo];

    [self.view.layer addSublayer:line2];
    [self.view.layer addSublayer:line3];
    [self.view.layer addSublayer:line4];
    
    [self.view addSubview:backButton];
    [self.view addSubview:shareFacebook];
    [self.view addSubview:shareTwitter];
    
}

-(void)closeModal
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)shareToFacebook
{
    NSArray *moodInfo = [self getMoodInfo];
    NSString *quote = [NSString stringWithFormat:@"\"%@\" - %@", moodInfo[1], moodInfo[2]];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeFacebook];
        [tweetSheet setInitialText:quote];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
}

-(void)shareToTwitter
{
    NSArray *moodInfo = [self getMoodInfo];
    NSString *quote = [NSString stringWithFormat:@"\"%@\" - %@", moodInfo[1], moodInfo[2]];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:quote];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
}

-(NSInteger)getQuoteCount
{
    return 5;
}

-(NSArray *)getMoodInfo
{
    
    NSInteger const ANGRY = 0;
    NSInteger const IMPATIENT = 1;
    NSInteger const ANXIOUS = 2;
    NSInteger const LONELY = 3;
    NSInteger const DEPRESSED = 4;
    NSInteger const TIRED = 5;
    NSInteger const SAD = 6;
    NSInteger const NOSTALGIC = 7;
    NSInteger const JEALOUS = 8;
    
    NSArray *quotes;
    UIColor *color;
    
    switch (self.mood) {
        case ANGRY:
            quotes = @[
                        @[@"Sometimes, I feel discriminated against, but it does not make me angry. It merely astonishes me. How can any deny themselves the pleasure of my company? It's beyond me.", @"Zora Neale Hurston"],
                        @[@"I'm not as angry as I used to be. But I can get in touch with that anger pretty quickly if I feel my space is being invaded or somebody is not treating me with the respect that I think I want.", @"Samuel L. Jackson"],
                        @[@"I'm mellower now, I'm over 50. But I don't think I'm too mellow. I'm still angry at a lot of things.", @"Henry Rollins"],
                        @[@"It's practically impossible to look at a penguin and feel angry.", @"Joe Moore"],
                        @[@"My uncle Sammy was an angry man. He had printed on his tombstone: What are you looking at?", @"Margaret Smith"]
                        ];
            
            color = [UIColor colorWithRed:232.0/255.0 green:92.0/255.0 blue:65.0/255.0 alpha:0.92];
            return @[@"angry", quotes[self.idx][0], quotes[self.idx][1], color];
            
        case IMPATIENT:
            quotes = @[
                       @[@"When someone is impatient and says, 'I haven't got all day,' I always wonder, How can that be? How can you not have all day?", @"George Carlin"],
                       @[@"I'm impatient. I get twitchy. When I get that feeling I just go out and make something happen.", @"John Cale"],
                       @[@"Intuition is a suspension of logic due to impatience.", @"Rita Mae Brown"],
                       @[@"The ear tends to be lazy, craves the familiar and is shocked by the unexpected; the eye, on the other hand, tends to be impatient, craves the novel and is bored by repetition.", @"W. H. Auden"],
                       @[@"I told her I'd wait forever for her, but that was before I found somebody else who'd give me a ride home.", @"Jarod Kintz"],
                       @[@"EVOO is extra-virgin olive oil. I first coined 'EVOO' on my cooking show because saying 'extra virgin olive oil' over and over was wordy, and I'm an impatient girl - that's why I make 30-minute meals!", @"Rachael Ray"]
                       ];
            
            color = [UIColor colorWithRed:115.0/255.0 green:208.0/255.0 blue:181.0/255.0 alpha:0.92];
            return @[@"impatient", quotes[self.idx][0], quotes[self.idx][1], color];
            
        case ANXIOUS:
            quotes = @[
                       @[@"True happiness is... to enjoy the present, without anxious dependence upon the future.", @"Lucius Annaeus Seneca"],
                       @[@"There are moments when all anxiety and stated toil are becalmed in the infinite leisure and repose of nature.", @"Henry David Thoreau"],
                       @[@"Anxiety does not empty tomorrow of its sorrows, but only empties today of its strength.", @"Charles Spurgeon"],
                       @[@"Nothing in the affairs of men is worthy of great anxiety.", @"Plato"],
                       @[@"We should not fret for what is past, nor should we be anxious about the future; men of discernment deal only with the present moment.", @"Chanakya"]
                       ];
            
            
            color = [UIColor colorWithRed:92.0/255.0 green:106.0/255.0 blue:136.0/255.0 alpha:0.92];
            return @[@"anxious", quotes[self.idx][0], quotes[self.idx][1], color];
        
        case LONELY:
            quotes = @[
                       @[@"To fulfill a dream, to be allowed to sweat over lonely labor, to be given a chance to create, is the meat and potatoes of life. The money is the gravy.", @"Bette Davis"],
                       @[@"No one really wants to admit they are lonely, and it is never really addressed very much between friends and family. But I have felt lonely many times in my life.", @"Bill Murray"],
                       @[@"I like the idea of being alone. I like the idea of often being alone in all aspects of my life. I like to feel lonely. I like to need things.", @"Robert Plant"],
                       @[@"If I'm such a legend, then why am I so lonely? Let me tell you, legends are all very well if you've got somebody around who loves you.", @"Judy Garland"],
                       @[@"For now, I'm just going to hang out with these two smoking hotties and fly privately around the world. It might be lonely up here, but I sure like the view.", @"Charlie Sheen"]
                       ];
            
            
            
            color = [UIColor colorWithRed:82.0/255.0 green:186.0/255.0 blue:213.0/255.0 alpha:0.92];
            return @[@"lonely", quotes[self.idx][0], quotes[self.idx][1], color];
        
        case DEPRESSED:
            quotes = @[
                       @[@"Art saved me; it got me through my depression and self-loathing, back to a place of innocence.", @"Jeanette Winterson"],
                       @[@"The concept of the 'good ol' days' must be one of our society's biggest delusions, top reasons for depression, as well as most often used excuse for lack of success.", @"Bo Bennett"],
                       @[@"That terrible mood of depression of whether it's any good or not is what is known as The Artist's Reward.", @"Ernest Hemingway"],
                       @[@"Certainly, I think being depressed is absolutely part of the human condition, it has to be, if there's joy there's its opposite, and it's something you ride if you possibly can.", @"Bob Geldof"],
                       @[@"I kind of like being depressed.", @"Nate Ruess"]
                       ];
            
            color = [UIColor colorWithRed:146.0/255.0 green:139.0/255.0 blue:137.0/255.0 alpha:0.92];
            return @[@"depressed", quotes[self.idx][0], quotes[self.idx][1], color];
        
        case TIRED:
            quotes = @[
                       @[@"Sleep did not honor me with it’s presence.", @"Alysha Speer"],
                       @[@"I got tired of feeling like Dracula. I wanted to see some daylight, and not just at six o’clock in the morning.", @"Kate Moss"],
                       @[@"Winston was gelatinous with fatigue.", @"George Orwell"],
                       @[@"Ten men waiting for me at the door? Send one of them home, I'm tired.", @"Mae West"],
                       @[@"Laziness is nothing more than the habit of resting before you get tired.", @"Jules Renard"]
                       ];
            
            color = [UIColor colorWithRed:190.0/255.0 green:179.0/255.0 blue:162.0/255.0 alpha:0.92];
            return @[@"tired", quotes[self.idx][0], quotes[self.idx][1], color];
        
        case SAD:
            quotes = @[
                       @[@"I seldom think about my limitations, and they never make me sad. Perhaps there is just a touch of yearning at times; but it is vague, like a breeze among flowers.", @"Helen Keller"],
                       @[@"So, this is my life. And I want you to know that I am both happy and sad and I'm still trying to figure out how that could be.", @"Stephen Chbosky"],
                      @[@"Don't cry because it's over, smile because it happened.", @"Dr. Seuss"],
                       @[@"Success is getting what you want, happiness is wanting what you get", @"W.P. Kinsella"],
                       @[@"It's been my experience that you can nearly always enjoy things if you make up your mind firmly that you will.", @"L.M. Montgomery"]
                       ];
            
            color = [UIColor colorWithRed:254.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:0.92];
            return @[@"sad", quotes[self.idx][0], quotes[self.idx][1], color];
        
        case NOSTALGIC:
            quotes = @[
                       @[@"I don't know what they are called, the spaces between seconds– but I think of you always in those intervals.", @"Salvador Plascencia"],
                       @[@"The concept of the 'good ol' days' must be one of our society's biggest delusions, top reasons for depression, as well as most often used excuse for lack of success.", @"Bo Bennett"],
                       @[@"Remembrance of things past is not necessarily the remembrance of things as they were.", @"Marcel Proust"],
                       @[@"We are homesick most for the places we have never known.", @"Carson McCullers"],
                       @[@"I don’t have a photograph, but you can have my footprints. They’re upstairs in my socks.", @"Groucho Marx"]
                       ];
            
            color = [UIColor colorWithRed:251.0/255.0 green:161.0/255.0 blue:125.0/255.0 alpha:0.92];
            return @[@"nostalgic", quotes[self.idx][0], quotes[self.idx][1], color];
            
        case JEALOUS:
            quotes = @[
                       @[@"If I had a clone, he’d better be my equal, and not my better. Can you imagine how I’d feel being jealous of myself?", @"Jarod Kintz"],
                       @[@"Don't waste time on jealousy. Sometimes you're ahead, sometimes you're behind.", @"Mary Schmich"],
                       @[@"People are taken aback by a confident, pretty girl who knows what she wants in life and isn't going to let anyone get in her way. And you know what it's all about? Jealousy.", @"Summer Altice"],
                       @[@"He that is jealous is not in love.", @"Saint Augustine"],
                       @[@"My wife's jealousy is getting ridiculous. The other day she looked at my calendar and wanted to know who May was.", @"Rodney Dangerfield"]
                       ];
            
            color = [UIColor colorWithRed:131.0/255.0 green:136.0/255.0 blue:92.0/255.0 alpha:0.92];
            return @[@"jealous", quotes[self.idx][0], quotes[self.idx][1], color];
    }
    
    return @[];
}

@end
