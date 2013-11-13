//
//  Pocket RosterViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/8/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "GetCoaches.h"

@interface GetCoaches ()

@end

@implementation GetCoaches

//+ (NSMutableDictionary *) getCoaches: (NSString *) linkForURLSearch
+(void) getCoachesInfo
{
    //int key = 0;
    NSString *urlStr = @"http://athletics.bowdoin.edu/sports/wbkb/coaches/index";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    NSLog(@" %@", htmlFromURL);
    
    
    NSString *stringBreakdown;
    NSString *allCoachElements;
    
    NSString *coachTitlePre;
    NSString *coachTitle;
    
    NSString *coachImagePre;
    NSString *coachImage;
    
    NSString *coachPositionPre;
    NSString *coachPosition;
    
    NSString *coachPhonePre;
    NSString *coachPhone;
    
    NSString *coachEmailPre;
    NSString *coachEmail;
    
    NSString *coachBioPre;
    NSString *wholeCoachesBioTab;
    NSString *coachBio;
    
    int dumbVariable = 1;
    
    /**
     ***************************************
     *   This is for the Coaches Profile  *
     ***************************************
     */
    NSMutableArray *bowdoinCoachesElements = [NSMutableArray new];
    
    /**
     ***************************************
     *                Parser               *
     ***************************************
     */

    
    NSScanner *megaScanner = [NSScanner scannerWithString:htmlFromURL];
    [megaScanner scanUpToString:@"div id=\"mainbody\" class=\"clearfix\">" intoString:NULL];
    [megaScanner scanUpToString:@"<footer class=\"clearfix\">" intoString:&allCoachElements];
    
    NSScanner *scanner = [NSScanner scannerWithString:allCoachElements];
    
    NSString *dummyCoachVariable;
    [scanner scanUpToString:@"class=\"bio-title\">" intoString:nil];
    [scanner scanUpToString:@"class=\"name" intoString:nil];
    [scanner scanUpToString:@"class=\"name" intoString:nil];
    
    //Key That will be the if statement
    //[scanner scanUpToString:@"div class=\"bio-wrap" intoString:nil];

    for (int i = 0; i < 1; i++)
    {
        [scanner scanUpToString:@"class=\"bio-title\">" intoString:nil];
        [scanner scanUpToString:@"class=\"name" intoString:nil];
        [scanner scanUpToString:@">" intoString:nil];
        [scanner scanUpToString:@"<" intoString:&coachTitlePre];
        coachTitle = [coachTitlePre substringFromIndex: dumbVariable];
        NSLog(@"Coach Name: %@", coachTitle);
        if (coachTitle)
        {
            // Adding Name
            [bowdoinCoachesElements addObject:coachTitle];
            // Adding Image
            [scanner scanUpToString:@"class=\"about" intoString:nil];
            [scanner scanUpToString:@"<img src=" intoString:nil];
            [scanner scanUpToString:@"\"" intoString:nil];
            [scanner scanUpToString:@"?" intoString:&coachImagePre];
            coachImage = [coachImagePre substringFromIndex: dumbVariable];
            NSLog(@"Coach's Image: %@", coachImage);
            
            if (coachImage)
            {
                [bowdoinCoachesElements addObject:coachImage];
            }
            
            // Add Position
            [scanner scanUpToString:@"class=\"lbl" intoString:nil];
            [scanner scanUpToString:@"class=\"val" intoString:nil];
            [scanner scanUpToString:@">" intoString:nil];
            [scanner scanUpToString:@"</td>" intoString:&coachPositionPre];
            coachPosition = [coachPositionPre substringFromIndex: dumbVariable];
            NSLog(@"Coach Position: %@", coachPosition);
            if (coachPosition)
            {
                [bowdoinCoachesElements addObject:coachPosition];
            }
            
            // Add Phone
            [scanner scanUpToString:@"class=\"lbl" intoString:NULL];
            [scanner scanUpToString:@"class=\"val" intoString:NULL];
            [scanner scanUpToString:@">" intoString:NULL];
            [scanner scanUpToString:@"</td>" intoString:&coachPhonePre];
            coachPhone = [coachPhonePre substringFromIndex: dumbVariable];
            NSLog(@"Coach Phone Number: %@", coachPhone);
            if (coachPhone)
            {
                [bowdoinCoachesElements addObject:coachPhonePre];
            }
            
            // Add email
            [scanner scanUpToString:@"class=\"lbl" intoString:NULL];
            [scanner scanUpToString:@"class=\"val" intoString:NULL];

            [scanner scanUpToString:@">" intoString:NULL];
            [scanner scanUpToString:@"</a>" intoString:&coachEmailPre];
            NSArray* breakDownString = [coachEmailPre componentsSeparatedByString:@">"];
            coachEmail = [breakDownString objectAtIndex: 2];
            NSLog(@"Coaches Email: %@", coachEmail);
            if (coachEmail)
            {
                [bowdoinCoachesElements addObject:coachEmail];
            }
            
            /**
            // Add bio
            [scanner scanUpToString:@"<div class=\"tab-content" intoString:NULL];
            [scanner scanUpToString:@"class=\"synopsis" intoString:NULL];
            [scanner scanUpToString:@"</div>" intoString:&wholeCoachesBioTab];
            
            NSScanner *miniScanner = [NSScanner scannerWithString:wholeCoachesBioTab];
            NSMutableString *wholeBio = [[NSMutableString alloc] initWithString:@""];
            
            //for (int i = 0; i < 10; i++)
            //{
                [miniScanner scanUpToString:@"<p>" intoString:NULL];
            
                [miniScanner scanUpToString:@"</p>" intoString:&coachBioPre];
                if(coachBioPre)
                {
                    //Test whether there is a bio video in the format

                    if ([coachBioPre rangeOfString:@"object"].location != NSNotFound)
                    {
                        [scanner scanUpToString:@"</object>" intoString:NULL];
                        [miniScanner scanUpToString:@"<p>" intoString:NULL];
                        [miniScanner scanUpToString:@"</p>" intoString:&coachBioPre];
                        coachBioPre = [coachBioPre substringFromIndex: 3];
                        [wholeBio appendString: coachBioPre];
                    }
                    else
                    {
                        coachBioPre = [coachBioPre substringFromIndex: 3];
                        [wholeBio appendString: coachBioPre];
                    }
                }
            //}
            coachBio = wholeBio;
            if (coachBio)
            {
                [bowdoinCoachesElements addObject:coachBio];
                NSLog(@"Coaches Bio: %@", coachBio);

            }
             */
        
        }
             
    }


}

@end
