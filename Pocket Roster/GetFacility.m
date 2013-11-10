//
//  GetSchedule.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/10/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "GetFacility.h"

@interface GetFacility ()

@end

@implementation GetFacility



//+ (NSMutableDictionary *) GetFacility: (NSString *) linkForURLSearch
+(void) GetFacility
{

    NSString *urlStr = @"http://athletics.bowdoin.edu/information/facilities/files/watson_arena";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    NSLog(@" This should be the URL used: %@", htmlFromURL);
    
    

    NSString *entireFacilitiesHTML;
    
    NSString *facilityName;
    NSString *facilityNamePre;

    NSMutableString *writingForFacilities = [[NSMutableString alloc] initWithString:@""];
    
    
    int dumbVariable = 1;
    int numberOfElements = 0;
    
    /**
     ***************************************************
     *   This is for all the elements in the schedule  *
     ***************************************************
     */
    NSMutableArray *allfacilitiesElements = [NSMutableArray new];
    
    /**
     ***************************************
     *    This is where we get the data     *
     ***************************************
     */

    
    NSScanner *megaScanner = [NSScanner scannerWithString:htmlFromURL];
    [megaScanner scanUpToString:@"<div class=\"rich mobile-article clearfix" intoString:NULL];
    [megaScanner scanUpToString:@"<div>" intoString:&entireFacilitiesHTML];
    
    NSScanner *scanner = [NSScanner scannerWithString:entireFacilitiesHTML];
    
    // For Name of facilities
    
    [scanner scanUpToString:@"<strong" intoString:nil];
    [scanner scanUpToString:@">" intoString:nil];
    [scanner scanUpToString:@"</strong>" intoString:&facilityNamePre];
    facilityName = [facilityNamePre substringFromIndex: dumbVariable];
    NSLog(@"%@", facilityName);
        
                if ( ![facilityName isEqual: NULL])
                {
                    numberOfElements++;
                    [allfacilitiesElements addObject:facilityName];
                }
    
    [scanner scanUpToString:@"\"" intoString:nil];
    [scanner scanUpToString:@">" intoString:nil];

    NSScanner *miniScanner1 = [NSScanner scannerWithString:entireFacilitiesHTML];
    [miniScanner1 scanUpToString:@"<div class=\"rich mobile-article clearfix" intoString:NULL];
    [miniScanner1 scanUpToString:@"<div>" intoString:&entireFacilitiesHTML];
            
    
        [scanner scanUpToString:@"tr class=\"schedule-row" intoString:nil];
        [scanner scanUpToString:@"/tr>" intoString:nil];
    //        [wholeBio appendString: coachBioPre];
    
}

@end
