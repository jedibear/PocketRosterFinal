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

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURL *theURL = [[NSURL alloc] initWithString:linkForURLSearch];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    

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
    [megaScanner scanUpToString:@"<div class=\"rich mobile-article clearfix" intoString:nil];
    [megaScanner scanUpToString:@"<div>" intoString:&entireFacilitiesHTML];
    
    NSScanner *scanner = [NSScanner scannerWithString:entireFacilitiesHTML];
    
    // For Name of facilities
    

    
        
    if ([entireFacilitiesHTML rangeOfString:@"<h2 class=\"article-title"].location != NSNotFound){
        
        [scanner scanUpToString:@"<h2 class=\"article-title" intoString:nil];
        [scanner scanUpToString:@">" intoString:nil];
        [scanner scanUpToString:@"</h2>" intoString:&facilityNamePre];
        
        facilityName = [facilityNamePre substringFromIndex: dumbVariable];
        
        numberOfElements++;
        [facility setObject:facilityName forKey:@"Name"];
        
        
    }else{
        
        [scanner scanUpToString:@"<strong" intoString:nil];
        [scanner scanUpToString:@">" intoString:nil];
        [scanner scanUpToString:@"</strong>" intoString:&facilityNamePre];
        
        facilityName = [facilityNamePre substringFromIndex: dumbVariable];
        
        numberOfElements++;
        [facility setObject:facilityName forKey:@"Name"];
    }

    
    
    [scanner scanUpToString:@"<p" intoString:nil];
    [scanner scanUpToString:@">" intoString:nil];
    [scanner scanUpToString:@"<img" intoString:&writingForFacilitiesPre];
    // If there is more writing this is where I will get it
    
    NSScanner *textScanner = [[NSScanner alloc]initWithString:writingForFacilitiesPre];
    [textScanner scanUpToString:@">" intoString:Nil];
    
    while ([textScanner scanUpToString:@"<" intoString:&writingForFacilitiesPre2]) {
        
        NSString *tmpStr;
        
        if ([writingForFacilitiesPre2 rangeOfString:@"&"].location != NSNotFound) {
            NSScanner *sneakyBastard = [[NSScanner alloc]initWithString:writingForFacilitiesPre2];
            
            NSMutableArray *stringElements = [[NSMutableArray alloc]init];
            while ([sneakyBastard scanUpToString:@"&" intoString:&tmpStr]) {
                
                if ([[tmpStr substringToIndex:1]isEqualToString:@";"]) {
                    tmpStr = [tmpStr substringFromIndex:1];
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
        
        [textScanner scanUpToString:@">" intoString:nil];
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
            }
            [scanner scanUpToString:@"<p>" intoString:nil];
        }
    }
    [facility setObject:allfacilitiesImages forKey:@"images"];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    return facility;
}
@end
