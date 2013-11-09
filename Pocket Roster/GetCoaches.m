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
    NSString *urlStr = @"http://athletics.bowdoin.edu/sports/bsb/coaches/index";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    NSLog(@" %@", htmlFromURL);
    
    
    NSString *stringBreakdown;
    NSString *entireRoster;
    
    NSString *rosterElement1Final;
    NSString *rosterElement1;
}

@end
