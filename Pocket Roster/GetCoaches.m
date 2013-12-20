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

+ (NSMutableDictionary *) getCoaches: (NSString *) linkForURLSearch{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    int key = 0;
    NSURL *theURL = [[NSURL alloc] initWithString:linkForURLSearch];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    NSString *baseURL = @"http://athletics.bowdoin.edu";
    

    NSString *allCoachElements, *coachTitlePre, *coachTitle, *coachImagePre, *coachImage;
    NSString *coachPositionPre, *coachPosition, *coachPhonePre, *coachPhone, *coachEmailPre;
    NSString *coachEmail, *test;
    
    int dumbVariable = 1;
    
    /**
     ***************************************
     *   This is for the Coaches Profile  *
     ***************************************
     */
    
    NSMutableDictionary *coaches = [NSMutableDictionary new];
   
    
    /**
     ***************************************
     *                Parser               *
     ***************************************
     */

    
    NSScanner *megaScanner = [NSScanner scannerWithString:htmlFromURL];
    [megaScanner scanUpToString:@"div id=\"mainbody\" class=\"clearfix\">" intoString:NULL];
    [megaScanner scanUpToString:@"<footer class=\"clearfix\">" intoString:&allCoachElements];
    
    NSScanner *scanner1 = [NSScanner scannerWithString:allCoachElements];
    
    //NSString *dummyCoachVariable;
    //[scanner scanUpToString:@"class=\"bio-title\">" intoString:nil];
    //[scanner scanUpToString:@"class=\"name" intoString:nil];
    //[scanner scanUpToString:@"class=\"name" intoString:nil];
    
    //Key That will be the if statement
    [scanner1 scanUpToString:@"div class=\"bio-wrap clearfix\"" intoString:nil];
    [scanner1 scanUpToString:@">" intoString:nil];

    while ([scanner1 scanUpToString:@"<div class=\"bio-wrap clearfix\"" intoString:&test]) {
        
        NSScanner *scanner = [[NSScanner alloc]initWithString:test];
        
        [scanner scanUpToString:@"class=\"bio-title\"" intoString:nil];
         NSMutableDictionary *bowdoinCoachesElements = [NSMutableDictionary new];
        
        [scanner scanUpToString:@"class=\"name" intoString:nil];
        [scanner scanUpToString:@">" intoString:nil];
        [scanner scanUpToString:@"<" intoString:&coachTitlePre];
        coachTitle = [coachTitlePre substringFromIndex: dumbVariable];
        
        if (coachTitle){
            
            // Adding Name
            [bowdoinCoachesElements setObject:coachTitle forKey:@"name"];
            
            // Adding Image
            [scanner scanUpToString:@"class=\"about" intoString:nil];
            [scanner scanUpToString:@"<img src=" intoString:nil];
            [scanner scanUpToString:@"\"" intoString:nil];
            [scanner scanUpToString:@"?" intoString:&coachImagePre];
            
            coachImage = [baseURL stringByAppendingString:[coachImagePre substringFromIndex: dumbVariable]];
            
            
            if (coachImage){
                NSURL *imageURL = [[NSURL alloc] initWithString:coachImage];
                NSData *imageData = [[NSData alloc]initWithContentsOfURL:imageURL];
                UIImage *coachPic= [[UIImage alloc]initWithData:imageData];
                [bowdoinCoachesElements setObject:coachPic forKey:@"image"];
            }else{
                
                UIImage *altPhoto = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rosterPhotoMissing" ofType:@"jpg"]];
                [bowdoinCoachesElements setObject:altPhoto forKey:@"image"];
            }
            
            // Add Position
            [scanner scanUpToString:@"class=\"lbl" intoString:nil];
            [scanner scanUpToString:@"class=\"val" intoString:nil];
            [scanner scanUpToString:@">" intoString:nil];
            [scanner scanUpToString:@"</td>" intoString:&coachPositionPre];
            
            coachPosition = [coachPositionPre substringFromIndex: dumbVariable];
            
            if (coachPosition){
                [bowdoinCoachesElements setObject:coachPosition forKey:@"position"];
            }
            
            // Add Phone
            if ([test rangeOfString:@"Phone"].location != NSNotFound) {
                [scanner scanUpToString:@"class=\"lbl" intoString:NULL];
                [scanner scanUpToString:@"class=\"val" intoString:NULL];
                [scanner scanUpToString:@">" intoString:NULL];
                [scanner scanUpToString:@"</td>" intoString:&coachPhonePre];
            
                coachPhone = [coachPhonePre substringFromIndex: dumbVariable];
                
                if (coachPhone){
                    [bowdoinCoachesElements setObject:coachPhone forKey:@"phone"];
                }
            }
            
            
            // Add email
            if ([test rangeOfString:@"Email"].location != NSNotFound) {
                [scanner scanUpToString:@"class=\"lbl" intoString:NULL];
                [scanner scanUpToString:@"class=\"val" intoString:NULL];

                [scanner scanUpToString:@">" intoString:NULL];
                [scanner scanUpToString:@"</a>" intoString:&coachEmailPre];
                NSArray* breakDownString = [coachEmailPre componentsSeparatedByString:@">"];
            
                coachEmail = [breakDownString objectAtIndex: 2];
            
                if (coachEmail){
                    [bowdoinCoachesElements setObject:coachEmail forKey:@"email"];
                }
            }
            
            
            
            NSString *failSafe;
            [scanner scanUpToString:@"<footer" intoString:&failSafe];
            
            if([failSafe rangeOfString:@"<div class=\"synopsis"].location != NSNotFound){
                
                
                
                NSScanner *desc = [[NSScanner alloc]initWithString:failSafe];
                
                
                [desc scanUpToString:@"<div class=\"synopsis" intoString:nil];
                [desc scanUpToString:@"<" intoString:nil];
                
                
                NSString *whatIWant, *test, *tmpStr;
                NSMutableArray *tmp = [[NSMutableArray alloc]init];
                
                
                [desc scanUpToString:@"</div" intoString:&whatIWant];
                
                
                NSScanner *lesGo = [[NSScanner alloc]initWithString:whatIWant];
                
                [lesGo scanUpToString:@"<p" intoString:nil];
                [lesGo scanUpToString:@">" intoString:nil];
                
                
                while ([lesGo scanUpToString:@"<" intoString:&test]) {
                    
                    if ([test rangeOfString:@"&"].location != NSNotFound) {
                        NSScanner *sneakyBastard = [[NSScanner alloc]initWithString:test];
                        
                        NSMutableArray *stringElements = [[NSMutableArray alloc]init];
                        while ([sneakyBastard scanUpToString:@"&" intoString:&tmpStr]) {
                            
                            [stringElements addObject:[tmpStr substringFromIndex:1]];
                            [sneakyBastard scanUpToString:@";" intoString:nil];
                        }
                        if (stringElements) {
                            
                            [tmp addObject:[stringElements componentsJoinedByString:@" "]];
                            
                        }
                        
                    }else{
                        [tmp addObject:[test substringFromIndex:1]];
                    }
                    
                    
                    
                    [lesGo scanUpToString:@">" intoString:nil];
                }
                
                NSString *final = [tmp componentsJoinedByString:@" "];
                [bowdoinCoachesElements setObject:final forKey:@"bio"];
            }
            
            
            
            [coaches setObject:bowdoinCoachesElements forKey:[NSString stringWithFormat:@"%d", key]];
            key++;
            
            [scanner1 scanUpToString:@">" intoString:nil];
            
        
        }
             
    }

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    return coaches;
}

@end
