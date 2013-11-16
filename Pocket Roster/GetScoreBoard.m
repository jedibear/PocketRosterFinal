//
//  GetScoreBoard.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/15/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "GetScoreBoard.h"

@implementation GetScoreBoard


//takes the URL of the Bowdoin Athletics Homepage in and returns an NSMutableDict filled with games played
+ (NSMutableDictionary *)getTheScoreBoard:(NSString *)homePageURL{
    
    int key = 1;
    NSLog(@"%@", homePageURL);
    NSString *team1, *team2, *sport, *score1, *score2, *status, *specialNote, *date, *tmp, *tmp2, *app, *test;
    
    NSURL *theURL = [[NSURL alloc]initWithString:homePageURL];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    NSString *htmlCode = [[NSString alloc]initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    NSMutableDictionary *scoreboard = [NSMutableDictionary new];
    NSMutableDictionary *contest = [NSMutableDictionary new];
    
    NSLog(@"here");
    
    NSScanner *bigScanner = [[NSScanner alloc]initWithString:htmlCode];
    
    [bigScanner scanUpToString:@"<div class=\"schedule-boxscore\">" intoString:&test];
    //NSLog(@"%@",test);
    [bigScanner scanUpToString:@"<div id=\"tabs-rcol-content2\">" intoString:&tmp];
    NSLog(@"%@",tmp);
    NSScanner *smallScanner = [[NSScanner alloc]initWithString:tmp];
    
    //get to the first boxscore entry
    [smallScanner scanUpToString:@"<div class=\"boxscore" intoString:nil];
    [smallScanner scanUpToString:@">" intoString:nil];
    
    //problem here, never gets past this
    while ([smallScanner scanUpToString:@"<div class=\"boxscore" intoString:&tmp2]) {
        
        NSLog(@"here2");
        
        NSScanner *baby = [[NSScanner alloc]initWithString:tmp2];
        
        //scan up to get the date
        [baby scanUpToString:@"<div class=\"date" intoString:nil];
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"</div>" intoString:&date];
        NSLog(@"%@", date);
        
        //put the date into the contest dict
        [contest setObject:[[date substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"date"];
        
        
        //get the sport
        [baby scanUpToString:@"<div class=\"sport" intoString:nil];
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"<" intoString:nil];
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"</span>" intoString:&sport];
        NSLog(@"%@", sport);
        
        //put the sport into the dict
        [contest setObject:[[sport substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"sport"];
        
        
        //get the score for team 1
        [baby scanUpToString:@"<div class=\"float-right score" intoString:nil];
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"</div>" intoString:&score1];
        NSLog(@"%@", score1);
        
        //put the score1 into the dict
        [contest setObject:[[score1 substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"score1"];
        
        //get team1
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"</div>" intoString:&team1];
        NSLog(@"%@", team1);
        
        //put team1 in the dict
        [contest setObject:[[team1 substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"team1"];
        
        
        //get appending str (either at or vs.)
        [baby scanUpToString:@"<div class=\"team\"" intoString:nil];
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"<div" intoString:&app];
        NSLog(@"%@app",app);
        
        
        
        //put the appending string into the dict
        [contest setObject:[[app substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"app"];
        
        
        //get the score for the 2nd team
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"</div>" intoString:&score2];
        NSLog(@"%@score2", score2);
        
        //save the score for the 2nd team
        [contest setObject:[[score2 substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"score2"];
        
        
        //get the 2nd team
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"</div>" intoString:&team2];
        NSLog(@"%@team2", team2);
        
        //save the 2nd team
        [contest setObject:[[team2 substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"team2"];
        
        //scan up to status, check to see if there were special notes
        [baby scanUpToString:@"<div class=\"status" intoString:&test];
        
        //take care of a case where there is a special note
        if([test rangeOfString:@"notes"].location != NSNotFound){
            [baby scanUpToString:@"<div class=\"notes" intoString:nil];
            [baby scanUpToString:@">" intoString:nil];
            [baby scanUpToString:@"</div>" intoString:&specialNote];
            
            [contest setObject:[[specialNote substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"note"];
        }
        
        //get the status
        [baby scanUpToString:@">" intoString:nil];
        [baby scanUpToString:@"</div>" intoString:&status];
        
        //save the status
        [contest setObject:[[status substringFromIndex:1]stringByReplacingOccurrencesOfString:@"\n" withString:@""] forKey:@"status"];
        
        
        //save this contest in the scoreboard
        NSString *scoreEntryKey = [[NSString alloc]initWithFormat:@"%d",key];
        [scoreboard setObject:contest forKey:scoreEntryKey];
        key++;
    }
    
    return scoreboard;
}

@end