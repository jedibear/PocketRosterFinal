//
//  GetFacility.m
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

    NSString *urlStr = @"http://athletics.bowdoin.edu/information/facilities/files/whittier";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    //NSLog(@" This should be the URL used: %@", htmlFromURL);
    
    

    NSString *entireFacilitiesHTML;
    
    NSString *facilityName;
    NSString *facilityNamePre;

    NSString *writingForFacilitiesPre;
    NSString *writingForFacilitiesPre2;
    NSString *writingForFacilitiesPre3;
    NSMutableString *writingForFacilities = [[NSMutableString alloc] initWithString:@""];
   
    NSString *imageVariable;
    NSString *imageVariablePre;
    
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
    NSLog(@"Facility Name: %@", facilityName);
        
                if ( ![facilityName isEqual: NULL])
                {
                    numberOfElements++;
                    [allfacilitiesElements addObject:facilityName];
                }
    //Gets the initial writing paragraph

    [scanner scanUpToString:@"<p" intoString:nil];
    [scanner scanUpToString:@">" intoString:nil];
    [scanner scanUpToString:@"</p>" intoString:&writingForFacilitiesPre];
    writingForFacilitiesPre2 = [writingForFacilitiesPre substringFromIndex: dumbVariable];
    [writingForFacilities appendString: writingForFacilitiesPre2];
//NSLog(@"Facility Writing: %@", writingForFacilitiesPre2);
// NSLog(@"Facility Total Writing: %@", writingForFacilities);
    [scanner scanUpToString:@"<p" intoString:nil];
    [scanner scanUpToString:@">" intoString:nil];
    [scanner scanUpToString:@"</p>" intoString:&writingForFacilitiesPre];
    // If there is more writing this is where I will get it
    while ([writingForFacilitiesPre rangeOfString:@"img style="].location == NSNotFound)
    {
        
        if ([writingForFacilitiesPre rangeOfString:@"<a href"].location != NSNotFound)
        {
            NSScanner *miniScanner = [NSScanner scannerWithString:writingForFacilitiesPre];
            [miniScanner scanUpToString:@"<a href" intoString:&writingForFacilitiesPre2];
            [writingForFacilities appendString: writingForFacilitiesPre2];
            [miniScanner scanUpToString:@">" intoString:nil];
            [miniScanner scanUpToString:@"</a>" intoString:&writingForFacilitiesPre2];
            writingForFacilitiesPre3 = [writingForFacilitiesPre2 substringFromIndex: dumbVariable];
            [writingForFacilities appendString: writingForFacilitiesPre3];
            NSLog(@"Facility Total Writing (IN IF): %@", writingForFacilities);
            
            [scanner scanUpToString:@"<p" intoString:nil];
            [scanner scanUpToString:@">" intoString:nil];
            [scanner scanUpToString:@"</p>" intoString:&writingForFacilitiesPre];
        }
        else
        {
            writingForFacilitiesPre2 = [writingForFacilitiesPre substringFromIndex: dumbVariable];
            [writingForFacilities appendString: writingForFacilitiesPre2];
            NSLog(@"Facility Total Writing (IN ELSE): %@", writingForFacilities);
            [scanner scanUpToString:@"<p" intoString:nil];
            [scanner scanUpToString:@">" intoString:nil];
            [scanner scanUpToString:@"</p>" intoString:&writingForFacilitiesPre];
        }
    }
     NSScanner *soloScanner = [NSScanner scannerWithString:writingForFacilitiesPre];
    [soloScanner scanUpToString:@"src=" intoString:&writingForFacilitiesPre2];
    for(int i = 0; i < 10; i++)
    {
        [scanner scanUpToString:@"<p>" intoString:nil];
        [scanner scanUpToString:@"src=" intoString:nil];
        [scanner scanUpToString:@"\"" intoString:nil];
        [scanner scanUpToString:@"?" intoString:&imageVariablePre];
        imageVariable = [imageVariablePre substringFromIndex: dumbVariable];
        
        if( ![imageVariable isEqual: NULL])
        {
            numberOfElements++;
            [allfacilitiesElements addObject:facilityName];
            NSLog(@"Number of Images: %d", numberOfElements);

            NSLog(@"Image Name: %@", facilityName);

        }
        
    }

}
@end
