//
//  GetImages.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 10/24/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "GetImages.h"

@implementation GetImages

+(void) getMostRecentImages
{
    
    NSString *urlStr = @"http://athletics.bowdoin.edu/landing/index";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    NSString *photoLinkBunch;
    
    
    NSString *photoAlbum1;
    NSString *photoAlbum1Final;
    
    
    int dumbVariable = 1;
    int numberOfElements = 0;
    
    NSMutableArray *teamLinks = [NSMutableArray new];
    
    NSScanner *miniScanner = [NSScanner scannerWithString:htmlFromURL];
    [miniScanner scanUpToString:@"photo-galleries\">" intoString:NULL];
    [miniScanner scanUpToString:@"combo-box\">" intoString:NULL];
    [miniScanner scanUpToString:@"</div>" intoString:&photoLinkBunch];
    
    /**
     ********************************
     *            Roster            *
     ********************************
     */
    
    NSScanner *linkScanner = [NSScanner scannerWithString:photoLinkBunch];
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&photoAlbum1];
    photoAlbum1Final = [photoAlbum1 substringFromIndex: dumbVariable];
    NSLog(@"%@", photoAlbum1Final);
    if (photoAlbum1Final)
    {
        numberOfElements++;
        [teamLinks addObject:photoAlbum1Final];
    }
}
@end
