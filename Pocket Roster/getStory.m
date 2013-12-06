//
//  getStory.m
//  Pocket Roster
//
//  Created by James P. Garvey on 12/6/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "getStory.h"

@implementation getStory

+(NSMutableDictionary*) getStory: (NSString *)inputURL{
    
    NSLog(@"inputURL%@", inputURL);
    
    NSString *baseURL = @"http://athletics.bowdoin.edu";
    NSString *tmpStr, *caption, *imgURL, *tmp2;
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *rssStory = [[NSMutableDictionary alloc]init];
    
    NSURL *url = [[NSURL alloc]initWithString:inputURL];
    NSLog(@"url=%@, inputURL =%@",url, inputURL);
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSError *error;
    
    NSData *htmlData = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
    
    if(error){
        NSLog(@"connection error");
    }
    
    
    NSString *htmlCode = [[NSString alloc]initWithData:htmlData encoding:NSASCIIStringEncoding];
    
   
    NSScanner *bigDaddy = [NSScanner scannerWithString:htmlCode];
    
    //scan up to the image, get the url then make the UIImage
    [bigDaddy scanUpToString:@"<div class=\"sidebar clearfix" intoString:nil];
    [bigDaddy scanUpToString:@"<img src" intoString:nil];
    [bigDaddy scanUpToString:@"/" intoString:nil];
    [bigDaddy scanUpToString:@"\"" intoString:&imgURL];
    
    NSURL *imageURL = [[NSURL alloc]initWithString:[baseURL stringByAppendingString:imgURL]];
    NSData *imageData = [[NSData alloc]initWithContentsOfURL:imageURL];
    
    UIImage *storyImage = [[UIImage alloc]initWithData:imageData];
    
    if(storyImage){
        [rssStory setObject:storyImage forKey:@"image"];
    }else{//default to a different photo if cant get photo
        UIImage *altPhoto = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rosterPhotoMissing" ofType:@"jpg"]];
        [rssStory setObject:altPhoto forKey:@"image"];
    }
    
    
    //get the caption if there is one
    if ([htmlCode rangeOfString:@"<dic class=\"thumb-caption clearfix"].location != NSNotFound) {
        [bigDaddy scanUpToString:@"<div class=\"thumb-caption clearfix" intoString:nil];
        [bigDaddy scanUpToString:@">" intoString:nil];
        [bigDaddy scanUpToString:@"</div" intoString:&caption];
    
        if(caption){
            [rssStory setObject:[caption substringFromIndex:1] forKey:@"caption"];
        }

    }
            
    [bigDaddy scanUpToString:@"<p" intoString:nil];
    [bigDaddy scanUpToString:@"</div" intoString:&tmpStr];
    
    NSScanner *baby = [[NSScanner alloc]initWithString:tmpStr];
    
    [baby scanUpToString:@">" intoString:nil];
    
    //scan through the story removing any html tags
    while ([baby scanUpToString:@"<" intoString:&tmp2]) {
        
        
        if ([tmp2 rangeOfString:@"&"].location != NSNotFound) {
            NSScanner *sneakyBastard = [[NSScanner alloc]initWithString:tmp2];
            
            NSMutableArray *stringElements = [[NSMutableArray alloc]init];
            while ([sneakyBastard scanUpToString:@"&" intoString:&tmpStr]) {
                
                [stringElements addObject:[tmpStr substringFromIndex:1]];
                [sneakyBastard scanUpToString:@";" intoString:nil];
            }
            if (stringElements) {
                
                [tmp addObject:[stringElements componentsJoinedByString:@" "]];
                
            }
            
        }else{
            [tmp addObject:[tmp2 substringFromIndex:1]];
        }
        
        
        
        [baby scanUpToString:@">" intoString:nil];
        
        
    }
    
    NSString *final = [tmp componentsJoinedByString:@" "];
    [rssStory setObject:final forKey:@"story"];
    
    return rssStory;
}

@end