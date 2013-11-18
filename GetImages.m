//
//  GetImages.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/8/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//


#import "GetImages.h"

@implementation GetImages

+(void) getMostRecentImages
{
    
    NSString *urlStr = @"http://athletics.bowdoin.edu/sports/mswimdive/team_photos/Men-s_Swimming_Team_Photos_Archive";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    NSString *photoBunch;
    NSString *photo1;
    NSString *photoFinal1;
    
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
    while([photoScanner scanUpToString:@"<div class=\"item" intoString:nil] )
    {
        [photoScanner scanUpToString:@"<div class=\"item" intoString:nil];
        [photoScanner scanUpToString:@"<a href=" intoString:nil];
        [photoScanner scanUpToString:@"<img src=" intoString:nil];
        
        [photoScanner scanUpToString:@"\"" intoString:nil];
        [photoScanner scanUpToString:@"?" intoString:&photo1];
        photoFinal1 = [photo1 substringFromIndex: dumbVariable];
        
        NSLog(@"This is the JPG: %@", photoFinal1);
        if(photoFinal1)
        {
            [photoTitles addObject:photoFinal1];
            
        }
    }
    
    
    
    
    
    
}



@end