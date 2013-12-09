//
//  GetImages.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/8/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//


#import "GetImages.h"

@implementation GetImages

+(NSMutableArray *) getMostRecentImages: (NSString *)link{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    NSURL *theURL = [[NSURL alloc] initWithString:link];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];

    NSString *photoBunch;    
    NSString *photo1;
    NSString *photoFinal1;
    NSString *baseURL = @"http://athletics.bowdoin.edu";
    
    int dumbVariable = 1;

    
    NSMutableArray *photoTitles = [NSMutableArray new];
    
    
    /**
     ********************************
     *          Get Photos          *
     ********************************
     */
    
    
        NSScanner *photoAlbumScanner = [NSScanner scannerWithString:htmlFromURL];

        [photoAlbumScanner scanUpToString:@"<div id=\"mainbody\" class=\"clearfix\">" intoString:NULL];
        [photoAlbumScanner scanUpToString:@"<div id=\"photo-gallery" intoString:NULL];
            
        [photoAlbumScanner scanUpToString:@"<script" intoString:&photoBunch];
        NSScanner *photoScanner = [NSScanner scannerWithString: photoBunch];
        while([photoScanner scanUpToString:@"<div class=\"item" intoString:nil] ){
            [photoScanner scanUpToString:@">" intoString:nil];
            [photoScanner scanUpToString:@"<a href=" intoString:nil];
            [photoScanner scanUpToString:@"<img src=" intoString:nil];

            [photoScanner scanUpToString:@"\"" intoString:nil];
            [photoScanner scanUpToString:@"?" intoString:&photo1];
            photoFinal1 = [photo1 substringFromIndex: dumbVariable];

            
                if(photoFinal1){
                   
                    NSURL *imageURL = [[NSURL alloc]initWithString:[baseURL stringByAppendingString:photoFinal1]];
                    NSData *imageData = [[NSData alloc]initWithContentsOfURL:imageURL];
                    UIImage *photo = [[UIImage alloc]initWithData:imageData];
                    
                    if (photo) {
                        [photoTitles addObject:photo];
                        
                    }
                    
  
                }
            }
    
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    return photoTitles;
}



@end