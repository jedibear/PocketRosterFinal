//
//  Get Schedule
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/10/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "GetSchedule.h"

@interface GetSchedule ()

@end

@implementation GetSchedule
//+(NSMutableDictionary *) getFacilities: (NSString *) linkForURLSearch;
//This method is just for testing while I can push
+(void) getSchedule;
{

    NSString *urlStr = @"http://athletics.bowdoin.edu/sports/bsb/2012-13/schedule";
    NSURL *theURL = [[NSURL alloc] initWithString:urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    NSString *stringBreakdown;
    NSString *entireRoster;
    
    NSString *scheduleElement1Final;
    NSString *scheduleElement1;
        
    int dumbVariable = 1;
    int numberOfElements = 0;
    
    /**
     ***************************************************
     *   This is for all the elements in the schedule  *
     ***************************************************
     */
    NSMutableArray *allScheduleElements = [NSMutableArray new];
    
    /**
     ***************************************
     *    This is where we get the data     *
     ***************************************
     */
    
    
    NSScanner *megaScanner = [NSScanner scannerWithString:htmlFromURL];
    [megaScanner scanUpToString:@"<table class=\"schedule" intoString:NULL];
    [megaScanner scanUpToString:@"</table>" intoString:&entireRoster];
     //NSLog(@"Entire Schedule String: %@", entireRoster);
    
    NSScanner *scanner = [NSScanner scannerWithString:entireRoster];
    [scanner scanUpToString:@"<tbody>" intoString:nil];
    [scanner scanUpToString:@"</tr>" intoString:nil];
    
    for(int i= 0; i < 1; i++)
    {
        [scanner scanUpToString:@"<tr" intoString:nil];
        [scanner scanUpToString:@"class=\"schedule-row" intoString:nil];
        [scanner scanUpToString:@"</tr>" intoString:&stringBreakdown];
        NSLog(@"First Entire Column: %@", stringBreakdown);

     /**
        NSScanner *miniScanner = [NSScanner scannerWithString:stringBreakdown];
        //Number
        for (int i = 0; i < 20; i++)
        {
            [miniScanner scanUpToString:@"<td" intoString:nil];
            [miniScanner scanUpToString:@">" intoString:nil];
            [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement1];
            scheduleElement1Final = [scheduleElement1 substringFromIndex: dumbVariable];
            NSLog(@"%@", scheduleElement1Final);
            
            if ( ![scheduleElement1Final isEqual: NULL])
            {
                numberOfElements++;
                [allScheduleElements addObject:scheduleElement1Final];
            }
            
        //}

        [scanner scanUpToString:@"\"" intoString:nil];
        [scanner scanUpToString:@"/tr>" intoString:nil];
      
*/
    }

}

@end
