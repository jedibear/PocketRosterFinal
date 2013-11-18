//
//  GetAlbums.m
//  tester
//
//  Created by Ryan Kulesza on 11/17/13.
//  Copyright (c) 2013 Kulesza Productions. All rights reserved.
//

#import "GetAlbums.h"

@implementation GetAlbums



+(void) getAllAlbums
{
    //NSString *urlStr = @"http://athletics.bowdoin.edu/landing/index";
    NSString *urlStr = @"http://athletics.bowdoin.edu/sports/mswimdive/index";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    NSString *photoLinkBunch;
    NSString *photoAlbum1;
    NSString *photoAlbum1Final;
    NSString *albumTitle1;
    NSString *albumTitle1Final;
    int dumbVariable = 1;
    int dumbVariable2 = 2;
    
    
    NSMutableArray *teamLinks = [NSMutableArray new];
    NSMutableArray *albumTitles = [NSMutableArray new];
    
    /**
     ********************************
     *      Whole Album String      *
     ********************************
     */
    
    NSScanner *miniScanner = [NSScanner scannerWithString:htmlFromURL];
    [miniScanner scanUpToString:@"photo-galleries\">" intoString:NULL];
    [miniScanner scanUpToString:@"combo-box\">" intoString:NULL];
    [miniScanner scanUpToString:@"</div>" intoString:&photoLinkBunch];
    
    /**
     ********************************
     *          Get Album           *
     ********************************
     */
    
    NSScanner *linkScanner = [NSScanner scannerWithString:photoLinkBunch];
    
    while ([linkScanner scanUpToString:@"<a href=" intoString:NULL])
        
    {
        NSMutableString *startURL = [[NSMutableString alloc] initWithString:@"http://athletics.bowdoin.edu"];
        
        [linkScanner scanUpToString:@"<a href=" intoString:NULL];
        [linkScanner scanUpToString:@"\"" intoString:NULL];
        [linkScanner scanUpToString:@"\">" intoString:&photoAlbum1];
        photoAlbum1Final = [photoAlbum1 substringFromIndex: dumbVariable];
        
        [startURL appendString: photoAlbum1Final];
        
        
        [linkScanner scanUpToString:@"</a>" intoString:&albumTitle1];
        albumTitle1Final = [albumTitle1 substringFromIndex: dumbVariable2];
        
        
        if (photoAlbum1Final)
        {
            [teamLinks addObject:startURL];
            NSLog(@"This is the album Title: %@", startURL);
            
            [albumTitles addObject:albumTitle1Final];
            NSLog(@"This is the album Title: %@", albumTitle1Final);
            
        }
        
    }
    
    
}

@end