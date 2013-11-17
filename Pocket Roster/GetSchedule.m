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

+(NSMutableDictionary *) getSchedule:(NSString *)linkForURLSearch{

    
    NSURL *theURL = [[NSURL alloc] initWithString:linkForURLSearch];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    //NSLog(@"%@ link", htmlFromURL);
    
    NSString *stringBreakdown,  *key;
    NSString *entireSchedule;
    
    NSString *scheduleElement1Final;
    NSString *scheduleElement1;
    NSString *scheduleElement2aFinal, *scheduleElement2bFinal;
    NSString *scheduleElement2;
    NSString *scheduleElement3Final;
    NSString *scheduleElement3;
    NSString *scheduleElement4Final;
    NSString *scheduleElement4;

    
        
    int dumbVariable = 1, keyNum = 1;
    
    
    /**
     ***************************************************
     *   This is for all the elements in the schedule  *
     ***************************************************
     */
   
    NSMutableDictionary *wholeSched = [NSMutableDictionary new];
    
    /**
     ***************************************
     *    This is where we get the data     *
     ***************************************
     */
    
    
    NSScanner *megaScanner = [NSScanner scannerWithString:htmlFromURL];
    
    if ([htmlFromURL rangeOfString:@"schedule-data"].location != NSNotFound) {
        [megaScanner scanUpToString:@"<table class=\"schedule-data" intoString:nil];
        [megaScanner scanUpToString:@"</table>" intoString:nil];
        
    }
    
    
    
    [megaScanner scanUpToString:@"<table class=\"schedule" intoString:nil];
    [megaScanner scanUpToString:@"</table>" intoString:&entireSchedule];
    
    
    NSScanner *scanner = [NSScanner scannerWithString:entireSchedule];
    




   
    
        //Number
    while ([scanner scanUpToString:@"<tr class=\"schedule-row" intoString:nil]){
        int numberOfElements = 0;
        NSMutableArray *allScheduleElements = [NSMutableArray new];
        
        
        [scanner scanUpToString:@"<tr class=\"schedule-row" intoString:nil];
        [scanner scanUpToString:@"</tr>" intoString:&stringBreakdown];
        
        NSScanner *miniScanner = [NSScanner scannerWithString:stringBreakdown];
        // Element 1
        [miniScanner scanUpToString:@"<td" intoString:nil];
        [miniScanner scanUpToString:@">" intoString:nil];
        [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement1];
        
        scheduleElement1Final = [[scheduleElement1 substringFromIndex: dumbVariable]stringByReplacingOccurrencesOfString:@"\n" withString:@""] ;
        
        NSScanner *scan1 = [[NSScanner alloc]initWithString:scheduleElement1Final];
        [scan1 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
        [scan1 scanUpToString:@"" intoString:&scheduleElement1Final];
        
        //
        if (scheduleElement1Final)
        {

            numberOfElements++;
            //NSLog(@"Element 1: %@", scheduleElement1Final);
        }
        
        // Element 2
        [miniScanner scanUpToString:@"<td" intoString:nil];
        [miniScanner scanUpToString:@">" intoString:nil];
        [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement2];
        
        
        scheduleElement2aFinal = [scheduleElement2 substringFromIndex: dumbVariable];
       
        
        
            if ([scheduleElement2aFinal rangeOfString:@"<b>"].location != NSNotFound)
            {
                
                
                NSScanner *subScanner = [NSScanner scannerWithString:scheduleElement2aFinal];
                [subScanner scanUpToString:@"<b" intoString:nil];
                [subScanner scanUpToString:@">" intoString:nil];
                //[subScanner scanUpToString:@"</b>" intoString:&scheduleElement1];
                
                [subScanner scanUpToString:@"\n" intoString:&scheduleElement2];
                scheduleElement2 = [scheduleElement2 substringFromIndex: dumbVariable];
                //NSArray* breakDownString = [scheduleElement2 componentsSeparatedByString:@"<"];
                
               
                NSScanner *scan2 = [[NSScanner alloc]initWithString:scheduleElement2aFinal];
                [scan2 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
                [scan2 scanUpToString:@"\n" intoString:&scheduleElement2aFinal];
                
                //scheduleElement2aFinal = [scheduleElement2aFinal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                scheduleElement2aFinal = [scheduleElement2aFinal stringByReplacingOccurrencesOfString:@"b>" withString:@""];
                
                [scan2 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
                [scan2 scanUpToString:@"\n" intoString:&scheduleElement2bFinal];
                
                scheduleElement2bFinal = [scheduleElement2bFinal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
            }else{
                NSScanner *scan2 = [[NSScanner alloc]initWithString:scheduleElement2aFinal];
                [scan2 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
                [scan2 scanUpToString:@"\n" intoString:&scheduleElement2aFinal];
                
                scheduleElement2aFinal = [scheduleElement2aFinal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
                
                [scan2 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
                [scan2 scanUpToString:@"\n" intoString:&scheduleElement2bFinal];
                
                
                scheduleElement2bFinal = [scheduleElement2bFinal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                scheduleElement2bFinal = [scheduleElement2bFinal substringToIndex:[scheduleElement2bFinal length]-1];
                
            }
            if (scheduleElement2aFinal){
                numberOfElements++;
                //NSLog(@"Element 2: %@", scheduleElement2Final);
            }
        
        
        
        
        
        
        //Element 3
        [miniScanner scanUpToString:@"<td" intoString:nil];
        [miniScanner scanUpToString:@">" intoString:nil];
        [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement3];
        
        scheduleElement3Final = [[scheduleElement3 substringFromIndex: dumbVariable]stringByReplacingOccurrencesOfString:@"\n" withString:@""];
               
        if([scheduleElement3Final rangeOfString:@"&"].location != NSNotFound){
            NSScanner *scan3 = [[NSScanner alloc]initWithString:scheduleElement3Final];
            [scan3 scanUpToString:@";" intoString:nil];
            [scan3 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
            [scan3 scanUpToString:@"  " intoString:&scheduleElement3Final];
        }else {
            NSScanner *scan3 = [[NSScanner alloc]initWithString:scheduleElement3Final];
            [scan3 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
            [scan3 scanUpToString:@"  " intoString:&scheduleElement3Final];
        }
        
        
        
        //        if (scheduleElement3Final)
        {
            numberOfElements++;
            //NSLog(@"Element 3: %@", scheduleElement3Final);
        }

        //Element 4
        [miniScanner scanUpToString:@"<td" intoString:nil];
        [miniScanner scanUpToString:@">" intoString:nil];
        [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement4];
        
        scheduleElement4Final = [[scheduleElement4 substringFromIndex: dumbVariable]stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        
        if([scheduleElement4Final rangeOfString:@"&"].location != NSNotFound){
            NSScanner *scan4 = [[NSScanner alloc]initWithString:scheduleElement4Final];
            [scan4 scanUpToString:@";" intoString:nil];
            [scan4 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
            [scan4 scanUpToString:@"  " intoString:&scheduleElement4Final];
        }else {
            NSScanner *scan4 = [[NSScanner alloc]initWithString:scheduleElement4Final];
            [scan4 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
            [scan4 scanUpToString:@"  " intoString:&scheduleElement4Final];
        }
        
        
        
        
        
        //
        if (scheduleElement4Final)
        {
            numberOfElements++;
            //NSLog(@"Element 4: %@", scheduleElement4Final);
        }
/*
        //Element 5
        [miniScanner scanUpToString:@"<td" intoString:nil];
        [miniScanner scanUpToString:@">" intoString:nil];
        [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement5];
        
        scheduleElement5Final = [[scheduleElement5 substringFromIndex: dumbVariable]stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        NSScanner *scan5 = [[NSScanner alloc]initWithString:scheduleElement5Final];
        [scan5 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
        [scan5 scanUpToString:@"  " intoString:&scheduleElement5Final];
        //
        if (scheduleElement5Final)
        {
            numberOfElements++;
            //NSLog(@"Element 5: %@", scheduleElement5Final);
        }
        
        //Element 6
        [miniScanner scanUpToString:@"<td" intoString:nil];
        [miniScanner scanUpToString:@">" intoString:nil];
        [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement6];
        
        scheduleElement6Final = [[scheduleElement6 substringFromIndex: dumbVariable]stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        NSScanner *scan6 = [[NSScanner alloc]initWithString:scheduleElement6Final];
        [scan6 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
        [scan6 scanUpToString:@"  " intoString:&scheduleElement6Final];
        //
        if (scheduleElement6Final)
        {
            numberOfElements++;
            //NSLog(@"Element 6: %@", scheduleElement6Final);
        }
        
        //Element 7
        [miniScanner scanUpToString:@"<td" intoString:nil];
        [miniScanner scanUpToString:@">" intoString:nil];
        [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement7];
        
        scheduleElement7Final = [[scheduleElement7 substringFromIndex: dumbVariable]stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        NSScanner *scan7 = [[NSScanner alloc]initWithString:scheduleElement7Final];
        [scan7 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
        [scan7 scanUpToString:@"  " intoString:&scheduleElement7Final];
        
        if (scheduleElement7Final)
        {
            numberOfElements++;
            //NSLog(@"Element 7: %@", scheduleElement7Final);
        }

        //Element 8
        [miniScanner scanUpToString:@"<td" intoString:nil];
        [miniScanner scanUpToString:@">" intoString:nil];
        [miniScanner scanUpToString:@"</td>" intoString:&scheduleElement8];
        
        scheduleElement8Final = [[scheduleElement8 substringFromIndex: dumbVariable]stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        NSScanner *scan8 = [[NSScanner alloc]initWithString:scheduleElement8Final];
        [scan8 scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
        [scan8 scanUpToString:@"  " intoString:&scheduleElement8Final];
        
        if (scheduleElement8Final)
        {
            numberOfElements++;
            //NSLog(@"Element 8: %@", scheduleElement8Final);
        }
 */

        [scanner scanUpToString:@"<tr class=\"schedule-row" intoString:nil];
        [scanner scanUpToString:@"</tr>" intoString:nil];
        
        if (numberOfElements == 3){
            [allScheduleElements addObject:scheduleElement1Final];
            [allScheduleElements addObject:[NSString stringWithFormat:@"%@%@",scheduleElement2aFinal,scheduleElement2bFinal]];
            [allScheduleElements addObject:scheduleElement3Final];
        }else if (numberOfElements == 4){
            [allScheduleElements addObject:scheduleElement1Final];
            [allScheduleElements addObject:[NSString stringWithFormat:@"%@%@",scheduleElement2aFinal,scheduleElement2bFinal]];
            [allScheduleElements addObject:scheduleElement3Final];
            [allScheduleElements addObject:scheduleElement4Final];
        }
        /*
        else if (numberOfElements == 5){
            [allScheduleElements addObject:scheduleElement1Final];
            [allScheduleElements addObject:[NSString stringWithFormat:@"%@%@",scheduleElement2aFinal,scheduleElement2bFinal]];
            [allScheduleElements addObject:scheduleElement3Final];
            [allScheduleElements addObject:scheduleElement4Final];
            [allScheduleElements addObject:scheduleElement5Final];
        }else if(numberOfElements == 6){
            [allScheduleElements addObject:scheduleElement1Final];
            [allScheduleElements addObject:[NSString stringWithFormat:@"%@%@",scheduleElement2aFinal,scheduleElement2bFinal]];
            [allScheduleElements addObject:scheduleElement3Final];
            [allScheduleElements addObject:scheduleElement4Final];
            [allScheduleElements addObject:scheduleElement5Final];
            [allScheduleElements addObject:scheduleElement6Final];
        }else if (numberOfElements == 7){
            [allScheduleElements addObject:scheduleElement1Final];
            [allScheduleElements addObject:[NSString stringWithFormat:@"%@%@",scheduleElement2aFinal,scheduleElement2bFinal]];
            [allScheduleElements addObject:scheduleElement3Final];
            [allScheduleElements addObject:scheduleElement4Final];
            [allScheduleElements addObject:scheduleElement5Final];
            [allScheduleElements addObject:scheduleElement6Final];
            [allScheduleElements addObject:scheduleElement7Final];
        }else if (numberOfElements == 8){
            [allScheduleElements addObject:scheduleElement1Final];
            [allScheduleElements addObject:[NSString stringWithFormat:@"%@%@",scheduleElement2aFinal,scheduleElement2bFinal]];
            [allScheduleElements addObject:scheduleElement3Final];
            [allScheduleElements addObject:scheduleElement4Final];
            [allScheduleElements addObject:scheduleElement5Final];
            [allScheduleElements addObject:scheduleElement6Final];
            [allScheduleElements addObject:scheduleElement7Final];
            [allScheduleElements addObject:scheduleElement8Final];
        }
*/
        key = [[NSString alloc]initWithFormat:@"%d", keyNum];
        [wholeSched setObject:allScheduleElements forKey:key];
        keyNum++;
    
    }
    return wholeSched;

}

@end
