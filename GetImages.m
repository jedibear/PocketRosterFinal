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
    
    NSString *urlStr = @"http://athletics.bowdoin.edu/landing/index";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    NSString *photoLinkBunch;
    
    
    NSString *photoAlbum1;
    NSString *photoAlbumFinal;
    NSString *photoAlbum1Final;
    
    int dumbVariable = 1;
    int numberOfElements = 0;
    
    NSMutableArray *teamLinks = [NSMutableArray new];
    
    /**
     ********************************
     *            Photo             *
     ********************************
     */
    
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
    for (int i=0; i< 1; i++)
    {
        [linkScanner scanUpToString:@"<a href=" intoString:NULL];
        [linkScanner scanUpToString:@"\"" intoString:NULL];
        [linkScanner scanUpToString:@"\">" intoString:&photoAlbum1];
        photoAlbum1Final = [photoAlbum1 substringFromIndex: dumbVariable];
        NSLog(@"This is the album link: %@", photoAlbum1Final);
        if (photoAlbum1Final)
        {
            
            NSURL *thePhotoAlbumURL = [[NSURL alloc] initWithString:photoAlbum1Final];
            
            NSMutableURLRequest *photoAlbumrequest = [[NSMutableURLRequest alloc] init];
            [photoAlbumrequest setURL: thePhotoAlbumURL];
            
            NSData *dataPhotoGalleryURL = [NSURLConnection sendSynchronousRequest:photoAlbumrequest returningResponse:NULL error:NULL];
            
            NSString * htmlForPhotoAlbum = [[NSString alloc] initWithData:dataPhotoGalleryURL encoding:NSASCIIStringEncoding];
            
            NSScanner *photoAlbumScanner = [NSScanner scannerWithString:htmlForPhotoAlbum];
            
            [photoAlbumScanner scanUpToString:@"<div id=\"mainbody\" class=\"clearfix\">" intoString:NULL];
            [photoAlbumScanner scanUpToString:@"<div id=\"photo-gallery" intoString:NULL];
            NSString *photoAlbumGroup;
            [photoAlbumScanner scanUpToString:@"<script src=\"" intoString:&photoAlbumGroup];
            for (int i=0; i< 20; i++)
            {
                NSScanner *photosScanner = [NSScanner scannerWithString:photoAlbumGroup];
                [photosScanner scanUpToString:@"<a href=" intoString:NULL];
                [photosScanner scanUpToString:@"<img src=\"" intoString:NULL];
                [photosScanner scanUpToString:@"\"" intoString:&photoAlbum1];
                photoAlbumFinal = [photoAlbum1 substringFromIndex: dumbVariable];
                [photosScanner scanUpToString:@"</a>" intoString:NULL];
                numberOfElements++;
                NSLog(@"Photo URL Jpg: %@", photoAlbumFinal);
                [teamLinks addObject:photoAlbumFinal];
            }
        }
    }
}



@end