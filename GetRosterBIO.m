//
//  GetRosterBIO.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "GetRosterBIO.h"

@implementation GetRosterBIO

+(NSMutableDictionary*) getBio: (NSString *)inputURL{
    
    NSString *baseURL = @"http://athletics.bowdoin.edu";
    
    NSString *relevantInfo;
    NSMutableDictionary *bioInfo = [[NSMutableDictionary alloc]init];
    
    
    NSURL *url = [[NSURL alloc]initWithString:inputURL];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    NSData *htmlCode = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    NSString *htmlCodeFromURL = [[NSString alloc]initWithData:htmlCode encoding:NSASCIIStringEncoding];
    
    NSScanner *bigDaddy = [NSScanner scannerWithString:htmlCodeFromURL];
    
    [bigDaddy scanUpToString:@"<div id=\"mainbody" intoString:nil];
    [bigDaddy scanUpToString:@"<div class=\"bio-title" intoString:nil];
    [bigDaddy scanUpToString:@"<img src" intoString:nil];
    [bigDaddy scanUpToString:@"\" alt" intoString:&relevantInfo];
    
    NSLog(@"%@", [baseURL stringByAppendingString:[relevantInfo substringFromIndex:10]]);
    NSURL *imageURL = [[NSURL alloc] initWithString:[baseURL stringByAppendingString:[relevantInfo substringFromIndex:10]]];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
    
    UIImage *athleteBioPhoto = [[UIImage alloc]initWithData:imageData];
    
    
    [bioInfo setObject:athleteBioPhoto forKey:@"image"];
    
    return bioInfo;
}

@end
