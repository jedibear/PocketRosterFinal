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
    
    NSString *relevantInfo, *playerAttributes, *thisAttrType, *attrTypeVal, *tmpStr;
    NSMutableDictionary *bioInfo = [[NSMutableDictionary alloc]init];
    
    
    NSURL *url = [[NSURL alloc]initWithString:inputURL];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    NSError *error;
    
    NSData *htmlCode = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
    
    if(error){
        NSLog(@"connection Error");
    }
    
    NSString *htmlCodeFromURL = [[NSString alloc]initWithData:htmlCode encoding:NSASCIIStringEncoding];
    
    NSScanner *bigDaddy = [NSScanner scannerWithString:htmlCodeFromURL];
    
    [bigDaddy scanUpToString:@"<div id=\"mainbody" intoString:nil];
    [bigDaddy scanUpToString:@"<div class=\"bio-title" intoString:nil];
    [bigDaddy scanUpToString:@"<img src" intoString:nil];
    [bigDaddy scanUpToString:@"\" alt" intoString:&relevantInfo];
    
   
    NSURL *imageURL = [[NSURL alloc] initWithString:[baseURL stringByAppendingString:[relevantInfo substringFromIndex:10]]];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
    
    UIImage *athleteBioPhoto = [[UIImage alloc]initWithData:imageData];
    
    if (athleteBioPhoto) {
        [bioInfo setObject:athleteBioPhoto forKey:@"image"];
    }else{
        NSLog(@"no bio photo");
        UIImage *altPhoto = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rosterPhotoMissing" ofType:@"jpg"]];
        [bioInfo setObject:altPhoto forKey:@"image"];
    }
    
    
    [bigDaddy scanUpToString:@"<table" intoString:nil];
    [bigDaddy scanUpToString:@"/table>" intoString:&playerAttributes];
    
    NSScanner *attr = [NSScanner scannerWithString:playerAttributes];
    
    while ([attr scanUpToString:@"class=\"lbl\"" intoString:&relevantInfo]){
        [attr scanUpToString:@">" intoString:nil];
        [attr scanUpToString:@": </td>" intoString:&thisAttrType];
        [attr scanUpToString:@"class=\"val\"" intoString:nil];
        [attr scanUpToString:@">" intoString:nil];
        [attr scanUpToString:@"</td>" intoString:&attrTypeVal];
        
        [bioInfo setObject:[attrTypeVal substringFromIndex:1] forKey:[thisAttrType substringFromIndex:1]];
    }
    
    
    
    NSString *failSafe;
    [bigDaddy scanUpToString:@"<footer" intoString:&failSafe];
    
    if([failSafe rangeOfString:@"<div class=\"synopsis"].location != NSNotFound){
        
        
        
        NSScanner *desc = [[NSScanner alloc]initWithString:failSafe];
        
        
        [desc scanUpToString:@"<div class=\"synopsis" intoString:nil];
        [desc scanUpToString:@"<" intoString:nil];
        
        
        NSString *whatIWant, *test;
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
        [bioInfo setObject:final forKey:@"bio"];
    }
    
    
    return bioInfo;
}

@end
