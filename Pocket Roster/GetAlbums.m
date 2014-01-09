//
//  GetAlbums.m
//  tester
//
//  Created by Ryan Kulesza on 11/17/13.
//  Copyright (c) 2013 Kulesza Productions. All rights reserved.
//

#import "GetAlbums.h"

@implementation GetAlbums



+(NSMutableDictionary *) getAllAlbums: (NSString *)linkForSearch{
   
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
   
    NSURL *theURL = [[NSURL alloc] initWithString:linkForSearch];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:theURL];
    
    NSError *error;
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
    /**
    if(error){
        NSLog(@"there was an error");
        NSLog(@"%@",[error localizedDescription]);
    }
     */
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    NSString *photoLinkBunch;
    NSString *photoAlbum1;
    NSString *photoAlbum1Final;
    NSString *albumTitle1;
    NSString *albumTitle1Final;
    int dumbVariable = 1;
    int dumbVariable2 = 2;
    int key = 1;
    
   
    NSMutableDictionary *albums = [NSMutableDictionary new];
    NSMutableArray *pictures = [NSMutableArray new];
    NSString *havePictures = @"NO";
    
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
    
    while ([linkScanner scanUpToString:@"<a href=" intoString:nil]){
        NSMutableDictionary *albumDetails = [NSMutableDictionary new];
        NSMutableString *startURL = [[NSMutableString alloc] initWithString:@"http://athletics.bowdoin.edu"];
        
        [linkScanner scanUpToString:@"<a href=" intoString:NULL];
        [linkScanner scanUpToString:@"\"" intoString:NULL];
        [linkScanner scanUpToString:@"\">" intoString:&photoAlbum1];
        photoAlbum1Final = [photoAlbum1 substringFromIndex: dumbVariable];
        
        [startURL appendString: photoAlbum1Final];
        
        
        [linkScanner scanUpToString:@"</a" intoString:&albumTitle1];
        albumTitle1Final = [albumTitle1 substringFromIndex: dumbVariable2];
        
        
        if (photoAlbum1Final)
        {
            [albumDetails setObject:startURL forKey:@"link"];
           
            
            [albumDetails setObject:albumTitle1Final forKey:@"title"];
            
            [albumDetails setObject:pictures forKey:@"pictures"];
            [albumDetails setObject:havePictures forKey:@"picturesLoaded"];
            
            [albums setObject:albumDetails forKey:[NSString stringWithFormat:@"%d", key]];
            key++;
        }
        
        [linkScanner scanUpToString:@">" intoString:nil];
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    return albums;
}

@end