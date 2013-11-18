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



+ (NSMutableDictionary *) GetFacility: (NSString *) linkForURLSearch{

    
    NSURL *theURL = [[NSURL alloc] initWithString:linkForURLSearch];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    //NSLog(@" This should be the URL used: %@", htmlFromURL);
    
    

    NSString *entireFacilitiesHTML;
    
    NSString *facilityName, *facilityNamePre;
    NSString *baseURL = @"http://athletics.bowdoin.edu";

    NSString *writingForFacilitiesPre;
    NSString *writingForFacilitiesPre2;
    NSString *writingForFacilitiesPre3;
    NSMutableString *writingForFacilities = [[NSMutableString alloc] initWithString:@""];
    NSString *checkVariable;
    NSString *imageVariable;
    NSString *imageVariablePre;
    
    NSMutableDictionary *facility = [NSMutableDictionary new];
    
    int dumbVariable = 1;
    int numberOfElements = 0;
    
    /**
     ***************************************************
     *   This is for all the elements in the schedule  *
     ***************************************************
     */
    NSMutableArray *allfacilitiesImages = [NSMutableArray new];
    
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
                    [facility setObject:facilityName forKey:@"Name"];
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
            NSString *dummyString = writingForFacilitiesPre;
            NSString *tmpStr;
            
            NSScanner *miniScanner = [NSScanner scannerWithString:dummyString];
            
            
            [miniScanner scanUpToString:@"<a href" intoString:&writingForFacilitiesPre2];
            
            if ([writingForFacilitiesPre2 rangeOfString:@"&"].location != NSNotFound) {
                NSScanner *sneakyBastard = [[NSScanner alloc]initWithString:writingForFacilitiesPre2];
                
                NSMutableArray *stringElements = [[NSMutableArray alloc]init];
                while ([sneakyBastard scanUpToString:@"&" intoString:&tmpStr]) {
                    
                    if ([[tmpStr substringToIndex:1]isEqualToString:@";"]) {
                        tmpStr = [tmpStr substringToIndex:1];
                    }
                    [stringElements addObject:tmpStr];
                    [sneakyBastard scanUpToString:@";" intoString:nil];
                }
                if (stringElements) {
                    
                    writingForFacilitiesPre2 = [stringElements componentsJoinedByString:@" "];
                    
                }
                
            }
            
            [writingForFacilities appendString: writingForFacilitiesPre2];
            [miniScanner scanUpToString:@">" intoString:nil];
            [miniScanner scanUpToString:@"</a>" intoString:&writingForFacilitiesPre2];
            
            if ([writingForFacilitiesPre2 rangeOfString:@"&"].location != NSNotFound) {
                NSScanner *sneakyBastard = [[NSScanner alloc]initWithString:writingForFacilitiesPre2];
                
                NSMutableArray *stringElements = [[NSMutableArray alloc]init];
                while ([sneakyBastard scanUpToString:@"&" intoString:&tmpStr]) {
                    
                    if ([[tmpStr substringToIndex:1]isEqualToString:@";"]) {
                        tmpStr = [tmpStr substringToIndex:1];
                    }
                    [stringElements addObject:tmpStr];
                    [sneakyBastard scanUpToString:@";" intoString:nil];
                }
                if (stringElements) {
                    
                    writingForFacilitiesPre2 = [stringElements componentsJoinedByString:@" "];
                    
                }
                
            }
            
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
            
            if ([writingForFacilitiesPre2 rangeOfString:@"&"].location != NSNotFound) {
                NSScanner *sneakyBastard = [[NSScanner alloc]initWithString:writingForFacilitiesPre2];
                NSString *tmpStr;
                NSMutableArray *stringElements = [[NSMutableArray alloc]init];
                while ([sneakyBastard scanUpToString:@"&" intoString:&tmpStr]) {
                    
                    [stringElements addObject:[tmpStr substringFromIndex:1]];
                    [sneakyBastard scanUpToString:@";" intoString:nil];
                }
                if (stringElements) {
                    
                    writingForFacilitiesPre2 = [stringElements componentsJoinedByString:@" "];
                    
                }
                
            }
            
            
            [writingForFacilities appendString: writingForFacilitiesPre2];
            NSLog(@"Facility Total Writing (IN ELSE): %@", writingForFacilities);
            [scanner scanUpToString:@"<p" intoString:nil];
            [scanner scanUpToString:@">" intoString:nil];
            [scanner scanUpToString:@"</p>" intoString:&writingForFacilitiesPre];
            writingForFacilitiesPre = [writingForFacilitiesPre substringFromIndex:1];
        }
    }
    
    
    [facility setObject:writingForFacilities forKey:@"facilitiesText"];
    
    
    while ([scanner scanUpToString:@"src=" intoString:&checkVariable]) {
        
        
        if ([writingForFacilitiesPre rangeOfString:@"<footer class="].location == NSNotFound)
        {

            [scanner scanUpToString:@"\"" intoString:nil];
            [scanner scanUpToString:@"?" intoString:&imageVariablePre];
            imageVariable = [imageVariablePre substringFromIndex: dumbVariable];
        
            if(imageVariable)
            {
                numberOfElements++;
                NSURL *imageURL = [[NSURL alloc] initWithString:[baseURL stringByAppendingString:imageVariable]];
                NSData *imageData = [[NSData alloc]initWithContentsOfURL:imageURL];
                UIImage *image = [[UIImage alloc]initWithData:imageData];
                
                if(image){
                    [allfacilitiesImages addObject:image];
                }
                NSLog(@"Number of Images: %d", numberOfElements);

                NSLog(@"Image Name: %@", facilityName);
            }
            [scanner scanUpToString:@"<p>" intoString:nil];
        }
    }
    [facility setObject:allfacilitiesImages forKey:@"images"];
    return facility;
}
@end
