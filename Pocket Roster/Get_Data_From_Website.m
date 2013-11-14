//
//  Get Data From Website.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 9/17/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "Get_Data_From_Website.h"
#import "GetRosterBIO.h"

@implementation Get_Data_From_Website

+ (NSMutableDictionary *) getInfo: (NSString *) linkForURLSearch
{
    int key = 0;
    
    NSURL *theURL = [[NSURL alloc] initWithString:linkForURLSearch];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];

    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    NSString *stringBreakdown;
    NSString *entireRoster;
    
    NSString *rosterElement0;
    NSString *rosterElement0Final;
    NSString *rosterElement1Final;
    NSString *rosterElement1;
    NSString *rosterElement2Final;
    NSString *rosterElement2;
    NSString *rosterElement3Final;
    NSString *rosterElement3;
    NSString *rosterElement4Final;
    NSString *rosterElement4;
    NSString *rosterElement5Final;
    NSString *rosterElement5;
    NSString *rosterElement6Final;
    NSString *rosterElement6;
    NSString *rosterElement7Final;
    NSString *rosterElement7;
    NSString *rosterElement8Final;
    NSString *rosterElement8;
 
    int dumbVariable = 1;
    int picDumbVariable = 9;
    
    NSString *baseURL = @"http://athletics.bowdoin.edu";
    
    
    /**
     ***************************************
     *   This is for the Athelete Profile  *
     ***************************************
    */
    NSMutableDictionary *bowdoinEntireTeam = [NSMutableDictionary new];
    
    NSMutableArray *rosterImages = [NSMutableArray new];
    NSMutableDictionary * bioInfo = [NSMutableDictionary new];
    
    /**
     ***************************************
     *      This is for the Table View     *
     ***************************************
     */
    
    
    NSMutableArray *singleRosterCells = [NSMutableArray new];
    

    NSScanner *megaScanner = [NSScanner scannerWithString:htmlFromURL];
    [megaScanner scanUpToString:@"<table class=\"roster" intoString:NULL];
    [megaScanner scanUpToString:@"</table>" intoString:&entireRoster];
    
    NSScanner *scanner = [NSScanner scannerWithString:entireRoster];
    
    // Name
   
    //Number
while ([scanner scanUpToString:@"tr class=\"roster-row" intoString:nil]) {
        
    int numberOfElements = 0;
    NSMutableArray *bowdoinPlayer = [NSMutableArray new];
    // Get Athlete
    [scanner scanUpToString:@"tr class=\"roster-row" intoString:nil];
    [scanner scanUpToString:@"/tr>" intoString:&stringBreakdown];
    
    //Get Athlete's Info
    NSScanner *miniScanner = [NSScanner scannerWithString:stringBreakdown];
    
    [miniScanner scanUpToString:@"<td" intoString:nil];
    [miniScanner scanUpToString:@">" intoString:nil];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement1];
    rosterElement1Final = [rosterElement1 substringFromIndex: dumbVariable];
   
   if ([rosterElement1Final rangeOfString:@"href"].location != NSNotFound)
   {
       NSScanner *nameScanner = [NSScanner scannerWithString:rosterElement1Final];
       [nameScanner scanUpToString:@"<a href=" intoString:NULL];
       
       [nameScanner scanUpToString:@"\">" intoString:&rosterElement0];
       rosterElement0Final = [baseURL stringByAppendingString:[rosterElement0 substringFromIndex:picDumbVariable]];
       
       [nameScanner scanUpToString:@"</a>" intoString:&rosterElement1];
       rosterElement1Final = [rosterElement1 substringFromIndex: dumbVariable+1];
       
       
       if ( ![rosterElement1Final isEqual: NULL])
       {
           numberOfElements++;
           
           [singleRosterCells addObject:rosterElement1Final];
       }
    
   }
    else
    {
        numberOfElements ++;
        [miniScanner scanUpToString:@"<a href=" intoString:NULL];
        
        [miniScanner scanUpToString:@"\">" intoString:&rosterElement0];
        rosterElement0Final = [baseURL stringByAppendingString:[rosterElement0 substringFromIndex:picDumbVariable]];
        
        [miniScanner scanUpToString:@"</a>" intoString:&rosterElement2];
        rosterElement2Final = [rosterElement2 substringFromIndex: dumbVariable+1];
        
        if (rosterElement2Final)
        {
            numberOfElements++;
            
        }
    }
    //Number
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement3];
    rosterElement3Final = [rosterElement3 substringFromIndex: dumbVariable];
    
    if (rosterElement3Final)
    {
        numberOfElements++;
        
    }

    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement4];
    rosterElement4Final = [rosterElement4 substringFromIndex: dumbVariable];
    
    if (rosterElement4Final)
    {
        numberOfElements++;
        }
    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement5];
    rosterElement5Final = [rosterElement5 substringFromIndex: dumbVariable];
    
    if (rosterElement5Final)
    {
        numberOfElements++;
       
    }
    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement6];
    rosterElement6Final = [rosterElement6 substringFromIndex: dumbVariable];
    
    if (rosterElement6Final)
    {
        numberOfElements++;
        
    }
    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement7];
    rosterElement7Final = [rosterElement7 substringFromIndex: dumbVariable];
   
    if (rosterElement7Final)
    {
        numberOfElements++;
    }
    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement8];
    rosterElement8Final = [rosterElement8 substringFromIndex: dumbVariable];
    
    if (rosterElement8Final)
    {
        numberOfElements++;
        
    }
    
    
    
    
    if (numberOfElements == 3){
        [bowdoinPlayer addObject:rosterElement0Final];
        [bowdoinPlayer addObject:rosterElement1Final];
        [bowdoinPlayer addObject:rosterElement3Final];
        [bowdoinPlayer addObject:rosterElement4Final];
    }else if (numberOfElements == 4){
        [bowdoinPlayer addObject:rosterElement0Final];
        [bowdoinPlayer addObject:rosterElement1Final];
        [bowdoinPlayer addObject:rosterElement3Final];
        [bowdoinPlayer addObject:rosterElement4Final];
        [bowdoinPlayer addObject:rosterElement5Final];
    }else if (numberOfElements == 5){
        [bowdoinPlayer addObject:rosterElement0Final];
        [bowdoinPlayer addObject:rosterElement1Final];
        [bowdoinPlayer addObject:rosterElement3Final];
        [bowdoinPlayer addObject:rosterElement6Final];
    }else if(numberOfElements == 6){
        [bowdoinPlayer addObject:rosterElement0Final];
        [bowdoinPlayer addObject:rosterElement1Final];
        [bowdoinPlayer addObject:rosterElement2Final];
        [bowdoinPlayer addObject:rosterElement3Final];
        [bowdoinPlayer addObject:rosterElement4Final];
        [bowdoinPlayer addObject:rosterElement6Final];
    }else if (numberOfElements == 7){
        [bowdoinPlayer addObject:rosterElement0Final];
        [bowdoinPlayer addObject:rosterElement1Final];
        [bowdoinPlayer addObject:rosterElement2Final];
        [bowdoinPlayer addObject:rosterElement3Final];
        [bowdoinPlayer addObject:rosterElement4Final];
        [bowdoinPlayer addObject:rosterElement7Final];
    }else if (numberOfElements == 8){
        [bowdoinPlayer addObject:rosterElement0Final];
        [bowdoinPlayer addObject:rosterElement1Final];
        [bowdoinPlayer addObject:rosterElement2Final];
        [bowdoinPlayer addObject:rosterElement3Final];
        [bowdoinPlayer addObject:rosterElement4Final];
        [bowdoinPlayer addObject:rosterElement8Final];
    }
    
    
    
    key++;
    [bowdoinEntireTeam setObject:bowdoinPlayer forKey:[NSString stringWithFormat:@"%d", key]];
     

     
}
   
return bowdoinEntireTeam;

    
}



@end
