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
    NSString *photoBunch;
    
    
    NSString *photoAlbum1;
    NSString *photoAlbumFinal;
    NSString *photoAlbum1Final;
    
    NSString *albumTitle1;
    NSString *albumTitle1Final;

    NSString *photo1;
    NSString *photoFinal1;
    
    int dumbVariable = 1;
    int dumbVariable2 = 2;
    int numberOfElements = 0;
    
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
    for (int i=0; i< 1; i++)
    {
        NSMutableString *startURL = [[NSMutableString alloc] initWithString:@"http://athletics.bowdoin.edu"];
        
        [linkScanner scanUpToString:@"<a href=" intoString:NULL];
        [linkScanner scanUpToString:@"\"" intoString:NULL];
        [linkScanner scanUpToString:@"\">" intoString:&photoAlbum1];
        photoAlbum1Final = [photoAlbum1 substringFromIndex: dumbVariable];
        //NSLog(@"This is the album link: %@", photoAlbum1Final);
        [startURL appendString: photoAlbum1Final];
        //NSLog(@"This is the FINAL album link: %@", startURL);

        [linkScanner scanUpToString:@"</a>" intoString:&albumTitle1];
        albumTitle1Final = [albumTitle1 substringFromIndex: dumbVariable2];
        //NSLog(@"This is the album Title: %@", albumTitle1Final);

        
        if (photoAlbum1Final)
        {
            // Translate URL
            NSURL *thePhotoAlbumURL = [[NSURL alloc] initWithString:startURL];

            NSMutableURLRequest *photoAlbumrequest = [[NSMutableURLRequest alloc] init];
            [photoAlbumrequest setURL: thePhotoAlbumURL];
            NSData *dataPhotoGalleryURL = [NSURLConnection sendSynchronousRequest:photoAlbumrequest returningResponse:NULL error:NULL];
            NSString * htmlForPhotoAlbum = [[NSString alloc] initWithData:dataPhotoGalleryURL encoding:NSASCIIStringEncoding];
            NSScanner *photoAlbumScanner = [NSScanner scannerWithString:htmlForPhotoAlbum];
            
            // Scanning the New URL
            [photoAlbumScanner scanUpToString:@"<div id=\"mainbody\" class=\"clearfix\">" intoString:NULL];
            [photoAlbumScanner scanUpToString:@"<div id=\"photo-gallery" intoString:NULL];

            [photoAlbumScanner scanUpToString:@"<script" intoString:&photoBunch];
            //NSLog(@"Photo HTML: %@", photoBunch);
            NSScanner *photoScanner = [NSScanner scannerWithString: photoBunch];
           while([photoScanner scanUpToString:@"<div class=\"item ready masonry-brick" intoString:nil] )
           {
               [photoScanner scanUpToString:@"<div class=\"item ready masonry-brick" intoString:nil];
               [photoScanner scanUpToString:@"</div>" intoString:&photo1];
               NSLog(@"This is the Tester: %@", photo1);
           }
            //[photoScanner scanUpToString:@"<div class=\"item ready masonry-brick" intoString:&photo1];
            //[photoScanner scanUpToString:@"<img src=" intoString:&photo1];
            //[photoScanner scanUpToString:@"<div class=\"item ready masonry-brick" intoString:nil];


            //NSLog(@"This is the Tester");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            //NSString *photoAlbumGroup;
            //while ([photoAlbumScanner scanUpToString:@"<div class=\"item ready masonry-brick" intoString:nil])
            
            //[photoAlbumScanner scanUpToString:@"<script src=\"" intoString:&photoAlbumGroup];
            //for (int i=0; i< 1; i++)
            //{
            //NSString *tester;
                //NSScanner *photosScanner = [NSScanner scannerWithString:photoAlbumGroup];
            //[photoScanner scanUpToString:@"<img scr=" intoString:&tester];
            //[photoScanner scanUpToString:@"<div class=\"item ready masonry-brick" intoString:&tester];
            //NSLog(@"Photo Number: %@", tester);
            /**
                [photoScanner scanUpToString:@"<a href=" intoString:NULL];
                [photoScanner scanUpToString:@"\"" intoString:NULL];
                [photoScanner scanUpToString:@"\"" intoString:&photo1];
                photoFinal1 = [photo1 substringFromIndex: dumbVariable];
                [photoScanner scanUpToString:@"</a>" intoString:NULL];
                numberOfElements++;
                NSLog(@"Photo Number: %d", numberOfElements);
                NSLog(@"Photo URL Jpg: %@", photoFinal1);
                //[teamLinks addObject:photoAlbumFinal];
            */
            //}
            
        }
    }
}



@end