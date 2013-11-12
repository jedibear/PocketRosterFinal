//
//  Get Data From Website.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 9/17/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "Get_Data_From_Website.h"

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
    int numberOfElements = 0;
    
    /**
     ***************************************
     *   This is for the Athelete Profile  *
     ***************************************
    */
    NSMutableDictionary *bowdoinEntireTeam = [NSMutableDictionary new];
    
    NSMutableArray *rosterImages = [NSMutableArray new];
    
    /**
     ***************************************
     *      This is for the Table View     *
     ***************************************
     */
    NSMutableDictionary *allRosterAthletes = [NSMutableDictionary new];
    NSMutableArray *singleRosterCells = [NSMutableArray new];
    

    NSScanner *megaScanner = [NSScanner scannerWithString:htmlFromURL];
    [megaScanner scanUpToString:@"<table class=\"roster" intoString:NULL];
    [megaScanner scanUpToString:@"</table>" intoString:&entireRoster];
    
    NSScanner *scanner = [NSScanner scannerWithString:entireRoster];
    
    // Name
   
    //Number
for (int i = 0; i < 100; i++)
{
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
    NSLog(@" ROSTER INFO: %@", rosterElement1Final);
   if ([rosterElement1Final rangeOfString:@"href"].location != NSNotFound)
   {
       NSScanner *nameScanner = [NSScanner scannerWithString:rosterElement1Final];
       [nameScanner scanUpToString:@"<a" intoString:NULL];
       [nameScanner scanUpToString:@">" intoString:NULL];
       [nameScanner scanUpToString:@"</a>" intoString:&rosterElement1];
       rosterElement1Final = [rosterElement1 substringFromIndex: dumbVariable];
       NSLog(@"ROSTER INFO: %@", rosterElement1Final);
       
       if ( ![rosterElement1Final isEqual: NULL])
       {
           numberOfElements++;
           [bowdoinPlayer addObject:rosterElement1Final];
           [singleRosterCells addObject:rosterElement1Final];
       }
    
   }
    else
    {
        [miniScanner scanUpToString:@"<a" intoString:NULL];
        [miniScanner scanUpToString:@">" intoString:NULL];
        [miniScanner scanUpToString:@"</a>" intoString:&rosterElement2];
        rosterElement2Final = [rosterElement2 substringFromIndex: dumbVariable];
        NSLog(@"ROSTER INFO: %@", rosterElement2Final);
        if (rosterElement2Final)
        {
            numberOfElements++;
            [bowdoinPlayer addObject:rosterElement2Final];
            [singleRosterCells addObject:rosterElement2Final];
            
        }
    }
    //Number
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement3];
    rosterElement3Final = [rosterElement3 substringFromIndex: dumbVariable];
    NSLog(@"ROSTER INFO: %@", rosterElement3Final);
    if (rosterElement3Final)
    {
        numberOfElements++;
        [bowdoinPlayer addObject:rosterElement3Final];
        [singleRosterCells addObject:rosterElement3Final];
    }

    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement4];
    rosterElement4Final = [rosterElement4 substringFromIndex: dumbVariable];
    NSLog(@"%@", rosterElement4Final);
    if (rosterElement4Final)
    {
        numberOfElements++;
        [bowdoinPlayer addObject:rosterElement4Final];
        
    }
    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement5];
    rosterElement5Final = [rosterElement5 substringFromIndex: dumbVariable];
    NSLog(@"%@", rosterElement5Final);
    if (rosterElement5Final)
    {
        numberOfElements++;
        [bowdoinPlayer addObject:rosterElement5Final];
    }
    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement6];
    rosterElement6Final = [rosterElement6 substringFromIndex: dumbVariable];
    NSLog(@"%@", rosterElement6Final);
    if (rosterElement6Final)
    {
        numberOfElements++;
        [bowdoinPlayer addObject:rosterElement6Final];
    }
    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement7];
    rosterElement7Final = [rosterElement7 substringFromIndex: dumbVariable];
    NSLog(@"%@", rosterElement7Final);
    if (rosterElement7Final)
    {
        numberOfElements++;
    }
    
    [miniScanner scanUpToString:@"<td" intoString:NULL];
    [miniScanner scanUpToString:@">" intoString:NULL];
    [miniScanner scanUpToString:@"</td>" intoString:&rosterElement8];
    rosterElement8Final = [rosterElement8 substringFromIndex: dumbVariable];
    NSLog(@"%@", rosterElement8Final);
    if (rosterElement8Final)
    {
        numberOfElements++;
        [bowdoinPlayer addObject:rosterElement8Final];
    }
    key++;
    [bowdoinEntireTeam setObject:bowdoinPlayer forKey:[NSString stringWithFormat:@"%d", key]];
     

     
}
   // NSLog(@"%@", bowdoinEntireTeam);
return bowdoinEntireTeam;
/*
    
    -(void)setTeamRosterMenBaseball{
        
        NSArray *images = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"FootballRosterPictures"];
        
        for (NSString *imagePath in images) {
            UIImage *anImage = [[UIImage alloc] initWithContentsOfFile:imagePath];
            
            NSArray *componentsOfPath = [imagePath componentsSeparatedByString:@"/"];
            NSString *athleteInfo = [componentsOfPath lastObject];
            NSArray *componentsOfAthleteInfo = [athleteInfo componentsSeparatedByString:@"."];
            
            
            if (![[componentsOfAthleteInfo objectAtIndex:1]isEqualToString:@"jpg"]) {
                NSString *number = [componentsOfAthleteInfo objectAtIndex:0];
                NSString *name = [componentsOfAthleteInfo objectAtIndex:1];
                NSString *year = [componentsOfAthleteInfo objectAtIndex:2];
                NSString *position = [componentsOfAthleteInfo objectAtIndex:3];
                NSString *height = [componentsOfAthleteInfo objectAtIndex:4];
                NSString *weight = [componentsOfAthleteInfo objectAtIndex:5];
                NSString *b&t = [componentsOfAthleteInfo objectAtIndex:6];
                NSString *hometown = [componentsOfAthleteInfo objectAtIndex:7];
                self.key = [componentsOfAthleteInfo objectAtIndex:8];
                
                
                
                [self.footballTeamRoster setObject:[NSArray arrayWithObjects:name, position, number, yearOfGraduation, anImage,  nil] forKey:self.key];
                //NSLog(@"%@", imagePath);
            }
        }
    }
    
 */
    
}



@end
