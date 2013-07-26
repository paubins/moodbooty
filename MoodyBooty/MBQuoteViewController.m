//
//  MBQuoteViewController.m
//  MoodyBooty
//
//  Created by paubins on 7/25/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBQuoteViewController.h"
#import "MBQuoteView.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreData/CoreData.h>

@implementation MBQuoteViewController


-(void) loadView
{
    
    NSArray *moodInfo = [self getMoodInfo];
    
    NSString *mood = moodInfo[0];
    NSString *quote = moodInfo[1];
    NSString *quoted = moodInfo[2];
    UIColor *color = moodInfo[3];
    
    [super viewDidLoad];
    
    self.view = [[MBQuoteView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height)];
    
    self.view.backgroundColor = color;
    
    UILabel *topLabel = [UILabel new];
    
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:[mood uppercaseString]];
    [attributedString addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString.length)];
    [topLabel setAttributedText:attributedString];
    
    topLabel.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:32/2];
//    topLabel.shadowColor = [UIColor blackColor];
//    topLabel.shadowOffset = CGSizeMake(-0.5, 0.5);
    
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
    
    
    UILabel *label = [UILabel new];
    
    NSMutableAttributedString *attributedString2;
    attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\u201C%@\u201D",quote]];
    [attributedString2 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString2.length)];
    [label setAttributedText:attributedString2];
    
    label.font = [UIFont fontWithName:@"FreightSansProMedium-Regular" size:18];
//    label.shadowColor = [UIColor blackColor];
//    label.shadowOffset = CGSizeMake(-0.5, 0.5);
    
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(35, 120, 250, 230);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];

    
    UIButton *backButton;
    UIBezierPath *linePath2;
    CAShapeLayer *line2;
    UITextView *attributedTo;
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
            
            //shape layer for the line
            line2 = [CAShapeLayer layer];
            line2.path = [linePath2 CGPath];
            line2.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line2.frame = CGRectMake(0, 480, 320, 1);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 480, 320, 146/2)];
            attributedTo = [[UITextView alloc] initWithFrame:CGRectMake(0, 340, 320, 40)];
        } else {
            linePath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.view.frame.size.width, 1)];
            
            //shape layer for the line
            line2 = [CAShapeLayer layer];
            line2.path = [linePath2 CGPath];
            line2.fillColor = [UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1].CGColor;
            line2.frame = CGRectMake(0, 390, 320, 1);
            
            backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 390, 320, 146/2)];
            attributedTo = [[UITextView alloc] initWithFrame:CGRectMake(0, 320, 320, 40)];
        }
    }

    attributedTo.editable = NO;
    attributedTo.backgroundColor = [UIColor clearColor];
    attributedTo.textAlignment = NSTextAlignmentCenter;
    attributedTo.textColor = [UIColor whiteColor];
    attributedTo.font = [UIFont fontWithName:@"FreightSansProBook-Regular" size:16];
    
    NSMutableAttributedString *attributedString3;
    attributedString3 = [[NSMutableAttributedString alloc] initWithString:[quoted uppercaseString]];
    [attributedString3 addAttribute:NSKernAttributeName value:@1 range:NSMakeRange(0, attributedString3.length)];
    
    [attributedTo setAttributedText:attributedString3];
    
    [backButton setTitle:[@"Back" uppercaseString] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchDown];
    [backButton setValue:[UIFont fontWithName:@"FreightSansProMedium-Regular" size:36/2] forKey:@"font"];
    

    
    [self.view addSubview:topLabel];
    [self.view.layer addSublayer:line];
    [self.view addSubview:imageView];
    [self.view addSubview:label];
    [self.view addSubview:attributedTo];
    [self.view.layer addSublayer:line2];
    [self.view addSubview:backButton];
    
}

-(void)closeModal
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    NSInteger idx;
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
            
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:232.0/255.0 green:92.0/255.0 blue:65.0/255.0 alpha:1];
            return @[@"angry", quotes[idx][0], quotes[idx][1], color];
            
        case IMPATIENT:
            quotes = @[
                       @[@"When someone is impatient and says, 'I haven't got all day,' I always wonder, How can that be? How can you not have all day?", @"George Carlin"],
                       @[@"I'm impatient. I get twitchy. When I get that feeling I just go out and make something happen.", @"John Cale"],
                       @[@"Intuition is a suspension of logic due to impatience.", @"Rita Mae Brown"],
                       @[@"Life is like dancing. If we have a big floor, many people will dance. Some will get angry when the rhythm changes. But life is changing all the time.", @"attribute"],
                       @[@"Life is like dancing. If we have a big floor, many people will dance. Some will get angry when the rhythm changes. But life is changing all the time.", @"attribute"]
                       ];
            
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:115.0/255.0 green:208.0/255.0 blue:181.0/255.0 alpha:1];
            return @[@"impatient", quotes[idx][0], quotes[idx][1], color];
            
        case ANXIOUS:
            quotes = @[
                       @[@"True happiness is... to enjoy the present, without anxious dependence upon the future.", @"Lucius Annaeus Seneca"],
                       @[@"There are moments when all anxiety and stated toil are becalmed in the infinite leisure and repose of nature.", @"Henry David Thoreau"],
                       @[@"Anxiety does not empty tomorrow of its sorrows, but only empties today of its strength.", @"Charles Spurgeon"],
                       @[@"Nothing in the affairs of men is worthy of great anxiety.", @"Plato"],
                       @[@"We should not fret for what is past, nor should we be anxious about the future; men of discernment deal only with the present moment.", @"Chanakya"]
                       ];
            
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:92.0/255.0 green:106.0/255.0 blue:136.0/255.0 alpha:1];
            return @[@"anxious", quotes[idx][0], quotes[idx][1], color];
        
        case LONELY:
            quotes = @[
                       @[@"To fulfill a dream, to be allowed to sweat over lonely labor, to be given a chance to create, is the meat and potatoes of life. The money is the gravy.", @"Bette Davis"],
                       @[@"No one really wants to admit they are lonely, and it is never really addressed very much between friends and family. But I have felt lonely many times in my life.", @"Bill Murray"],
                       @[@"I like the idea of being alone. I like the idea of often being alone in all aspects of my life. I like to feel lonely. I like to need things.", @"Robert Plant"],
                       @[@"If I'm such a legend, then why am I so lonely? Let me tell you, legends are all very well if you've got somebody around who loves you.", @"Judy Garland"],
                       @[@"For now, I'm just going to hang out with these two smoking hotties and fly privately around the world. It might be lonely up here, but I sure like the view.", @"Charlie Sheen"]
                       ];
            
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:82.0/255.0 green:186.0/255.0 blue:213.0/255.0 alpha:1];
            return @[@"lonely", quotes[idx][0], quotes[idx][1], color];
        
        case DEPRESSED:
            quotes = @[
                       @[@"Art saved me; it got me through my depression and self-loathing, back to a place of innocence.", @"Jeanette Winterson"],
                       @[@"The concept of the 'good ol' days' must be one of our society's biggest delusions, top reasons for depression, as well as most often used excuse for lack of success.", @"Bo Bennett"],
                       @[@"That terrible mood of depression of whether it's any good or not is what is known as The Artist's Reward.", @"Ernest Hemingway"],
                       @[@"Certainly, I think being depressed is absolutely part of the human condition, it has to be, if there's joy there's its opposite, and it's something you ride if you possibly can.", @"Bob Geldof"],
                       @[@"I kind of like being depressed.", @"Nate Ruess"]
                       ];
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:146.0/255.0 green:139.0/255.0 blue:137.0/255.0 alpha:1];
            return @[@"depressed", quotes[idx][0], quotes[idx][1], color];
        
        case TIRED:
            quotes = @[
                       @[@"Sleep did not honor me with it’s presence.", @"Alysha Speer"],
                       @[@"I got tired of feeling like Dracula. I wanted to see some daylight, and not just at six o’clock in the morning.", @"Kate Moss"],
                       @[@"Winston was gelatinous with fatigue.", @"George Orwell"],
                       @[@"Ten men waiting for me at the door? Send one of them home, I'm tired.", @"Mae West"],
                       @[@"Laziness is nothing more than the habit of resting before you get tired.", @"Jules Renard"]
                       ];
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:190.0/255.0 green:179.0/255.0 blue:162.0/255.0 alpha:1];
            return @[@"tired", quotes[idx][0], quotes[idx][1], color];
        
        case SAD:
            quotes = @[
                       @[@"I seldom think about my limitations, and they never make me sad. Perhaps there is just a touch of yearning at times; but it is vague, like a breeze among flowers.", @"Helen Keller"],
                       @[@"So, this is my life. And I want you to know that I am both happy and sad and I'm still trying to figure out how that could be.", @"Stephen Chbosky"],
                      @[@"Don't cry because it's over, smile because it happened.", @"Dr. Seuss"],
                       @[@"Success is getting what you want, happiness is wanting what you get", @"W.P. Kinsella"],
                       @[@"It's been my experience that you can nearly always enjoy things if you make up your mind firmly that you will.", @"L.M. Montgomery"]
                       ];
            
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:254.0/255.0 green:189.0/255.0 blue:86.0/255.0 alpha:1];
            return @[@"sad", quotes[idx][0], quotes[idx][1], color];
        
        case NOSTALGIC:
            quotes = @[
                       @[@"I don't know what they are called, the spaces between seconds– but I think of you always in those intervals.", @"Salvador Plascencia"],
                       @[@"The concept of the 'good ol' days' must be one of our society's biggest delusions, top reasons for depression, as well as most often used excuse for lack of success.", @"Bo Bennett"],
                       @[@"Remembrance of things past is not necessarily the remembrance of things as they were.", @"Marcel Proust"],
                       @[@"We are homesick most for the places we have never known.", @"Carson McCullers"],
                       @[@"I don’t have a photograph, but you can have my footprints. They’re upstairs in my socks.", @"Groucho Marx"]
                       ];
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:251.0/255.0 green:161.0/255.0 blue:125.0/255.0 alpha:1];
            return @[@"nostalgic", quotes[idx][0], quotes[idx][1], color];
            
        case JEALOUS:
            quotes = @[
                       @[@"If I had a clone, he’d better be my equal, and not my better. Can you imagine how I’d feel being jealous of myself?", @"Jarod Kintz"],
                       @[@"Don't waste time on jealousy. Sometimes you're ahead, sometimes you're behind.", @"Mary Schmich"],
                       @[@"People are taken aback by a confident, pretty girl who knows what she wants in life and isn't going to let anyone get in her way. And you know what it's all about? Jealousy.", @"Summer Altice"],
                       @[@"He that is jealous is not in love.", @"Saint Augustine"],
                       @[@"My wife's jealousy is getting ridiculous. The other day she looked at my calendar and wanted to know who May was.", @"Rodney Dangerfield"]
                       ];
            
            
            idx = random() % [quotes count];
            
            color = [UIColor colorWithRed:131.0/255.0 green:136.0/255.0 blue:92.0/255.0 alpha:1];
            return @[@"jealous", quotes[idx][0], quotes[idx][1], color];
    }
    
    return @[];
}

@end
