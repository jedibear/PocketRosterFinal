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
    

    for (int i = 0; i < 5; i++)
    {
        [scanner scanUpToString:@"class=\"bio-title\">" intoString:nil];
        [scanner scanUpToString:@"class=\"name" intoString:nil];
        [scanner scanUpToString:@">" intoString:nil];
        [scanner scanUpToString:@"<" intoString:&coachTitlePre];
        coachTitle = [coachTitlePre substringFromIndex: dumbVariable];
        NSLog(@"%@", coachTitle);
        if (coachTitle)
        {
            // Adding Name
            [bowdoinCoachesElements addObject:coachTitle];
            // Adding Image
            [scanner scanUpToString:@"class=\"about" intoString:NULL];
            [scanner scanUpToString:@"<img src=" intoString:NULL];
            [scanner scanUpToString:@"\"" intoString:NULL];
            [scanner scanUpToString:@"\"" intoString:&coachImagePre];
            coachImage = [coachImagePre substringFromIndex: dumbVariable];
            NSLog(@"%@", coachImage);
            if (coachImage)
            {
                [bowdoinCoachesElements addObject:coachImage];
            }
            // Add Position
            [scanner scanUpToString:@"class=\"about" intoString:NULL];
            [scanner scanUpToString:@"<img src=" intoString:NULL];
            [scanner scanUpToString:@"\"" intoString:NULL];
            [scanner scanUpToString:@"\"" intoString:&coachImagePre];
            coachImage = [coachImagePre substringFromIndex: dumbVariable];
            NSLog(@"%@", coachImage);
            if (coachImage)
            {
                [bowdoinCoachesElements addObject:coachImage];
            }
        }
    }


}

@end
