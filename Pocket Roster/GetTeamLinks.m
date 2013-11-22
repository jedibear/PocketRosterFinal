//
//  GetTeamLinks.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 10/23/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "GetTeamLinks.h"

@implementation GetTeamLinks

+(NSMutableArray *) getTeamLinkBreakdown:(NSString *)incommingURL
{

    NSLog(@"%@", incommingURL);
    
    NSURL *theURL = [[NSURL alloc] initWithString:incommingURL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSError *error;
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
    
    if(error){
        NSLog(@"THERE WAS A PROBLEM");
    }
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    NSString *linksString;

    
    NSString *rosterTabFinal;
    NSString *rosterTab;
    NSString *scheduleTab;
    NSString *scheduleTabFinal;
    NSString *newsTab;
    NSString *newsTabFinal;
    NSString *coachesTabFinal;
    NSString *coachesTab;
    NSString *facilitiesTabFinal;
    NSString *facilitiesTab;
    NSString *recordsTabFinal;
    NSString *recordsTab;
    
    
    
    int dumbVariable = 1;
    int numberOfElements = 0;
    
    NSMutableArray *teamLinks = [NSMutableArray new];
    NSString *baseURL = @"http://athletics.bowdoin.edu";
    
    NSScanner *miniScanner = [NSScanner scannerWithString:htmlFromURL];
    [miniScanner scanUpToString:@"navbar-secondary" intoString:nil];
    [miniScanner scanUpToString:@"<div id=\"links-container\">" intoString:nil];
    [miniScanner scanUpToString:@"</div>" intoString:&linksString];
        /**
     ********************************
     *            Roster            *
     ********************************
     */
    
    NSScanner *linkScanner = [NSScanner scannerWithString:linksString];
        [linkScanner scanUpToString:@">Home</a>" intoString:NULL];
        [linkScanner scanUpToString:@"<a href=" intoString:NULL];
        [linkScanner scanUpToString:@"\"" intoString:NULL];
        [linkScanner scanUpToString:@"\">" intoString:&rosterTab];
    
   
        rosterTabFinal = [baseURL stringByAppendingString:[rosterTab substringFromIndex: dumbVariable]];
        //NSLog(@"%@", rosterTabFinal);
        if (rosterTabFinal)
        {
            numberOfElements++;
            [teamLinks addObject:rosterTabFinal];
        }
    /**
     ********************************
     *        Schedule/Results      *
     ********************************
     */
    
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&scheduleTab];
    scheduleTabFinal = [baseURL stringByAppendingString:[scheduleTab substringFromIndex: dumbVariable]];
    //NSLog(@"%@", scheduleTabFinal);
    if (scheduleTabFinal)
    {
        numberOfElements++;
        [teamLinks addObject:scheduleTabFinal];
    }
    
    /**
     ********************************
     *             News             *
     ********************************
     */
    
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&newsTab];
    newsTabFinal = [baseURL stringByAppendingString:[newsTab substringFromIndex: dumbVariable]];
    //NSLog(@"%@", newsTabFinal);
    if (newsTabFinal)
    {
        numberOfElements++;
        [teamLinks addObject:newsTabFinal];
    }
    
    /**
     ********************************
     *             Coaches          *
     ********************************
     */
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&coachesTab];
    coachesTabFinal = [baseURL stringByAppendingString:[coachesTab substringFromIndex: dumbVariable]];
   // NSLog(@"%@", coachesTabFinal);
    if (coachesTabFinal)
    {
        numberOfElements++;
        [teamLinks addObject:coachesTabFinal];
    }
 
    /**
     ********************************
     *          Facilities          *
     ********************************
     */
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&facilitiesTab];
    facilitiesTabFinal = [baseURL stringByAppendingString:[facilitiesTab substringFromIndex: dumbVariable]];
    //NSLog(@"%@", facilitiesTabFinal);
    if (facilitiesTabFinal)
    {
        numberOfElements++;
        [teamLinks addObject:facilitiesTabFinal];
    }
    
    /**
     ********************************
     *            Records           *
     ********************************
     */
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&recordsTab];
    recordsTabFinal = [baseURL stringByAppendingString:[recordsTab substringFromIndex: dumbVariable]];
   // NSLog(@"%@", recordsTabFinal);
    if (recordsTabFinal)
    {
        numberOfElements++;
        [teamLinks addObject:recordsTabFinal];
    }
    
    
    return teamLinks;
    
}
@end
