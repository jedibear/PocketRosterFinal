//
//  RosterTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 4/20/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "RosterTVC.h"
#import "RosterCell.h"
#import "GetRosterBIO.h"
#import "Get_Data_From_Website.h"
#import "RosterAthleteViewController.h"

@interface RosterTVC ()

@end

@implementation RosterTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSMutableDictionary*) teamRoster{
    
    if(!_teamRoster){
        _teamRoster = [[NSMutableDictionary alloc] init];
    }
    return _teamRoster;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.teamRoster count]-1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RosterCell";
    
    RosterCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    self.key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
    
    NSArray* athleteObjects = [self.teamRoster objectForKey:self.key];
    
    if(cell == nil && [athleteObjects objectAtIndex:0]!=nil ) {
        cell = [[RosterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    
    NSString *athleteName, *athleteDetails;
    
    if ([athleteObjects objectAtIndex:0]!=nil) {
        
        if([athleteObjects count] == 4){
            athleteName = [[NSString alloc]initWithFormat:@"%@    %@", [athleteObjects objectAtIndex:1], [athleteObjects objectAtIndex:2]];
            athleteDetails = [[NSString alloc]initWithFormat:@"%@", [athleteObjects objectAtIndex:3]];
        }else if([athleteObjects count] == 5){
            athleteName = [[NSString alloc]initWithFormat:@"%@    %@", [athleteObjects objectAtIndex:1], [athleteObjects objectAtIndex:2]];
            athleteDetails = [[NSString alloc]initWithFormat:@"%@     %@", [athleteObjects objectAtIndex:3], [athleteObjects objectAtIndex:4]];
        }else{
            athleteName = [[NSString alloc]initWithFormat:@"%@    %@    %@", [athleteObjects objectAtIndex:1], [athleteObjects objectAtIndex:2], [athleteObjects objectAtIndex:3]];
            athleteDetails = [[NSString alloc]initWithFormat:@"%@   %@",  [athleteObjects objectAtIndex:4] ,[athleteObjects objectAtIndex:5]];
        }
        
        UIImage* athletePic = [[athleteObjects objectAtIndex:0] objectForKey:@"image"];
        self.athleteImage = athletePic;
        cell.athleteName.text = athleteName;
        cell.athleteDetails.text = athleteDetails;
        cell.athleteImage.image = athletePic;
       
    }
    
    
    
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        //RosterCell *cell = sender;
        if(indexPath){
    
            if ([segue.identifier isEqualToString:@"athleteBio"]) {
                if ([segue.destinationViewController isKindOfClass:[RosterAthleteViewController class]]) {
                    
                    RosterAthleteViewController *rAVC = (RosterAthleteViewController *)segue.destinationViewController;
                    
                    self.key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
                    NSArray* athleteObjects = [self.teamRoster objectForKey:self.key];
                    
                    if([athleteObjects count]==4 || [athleteObjects count]==5){
                        rAVC.athleteName = [athleteObjects objectAtIndex:1];
                    }else{
                        rAVC.athleteName = [athleteObjects objectAtIndex:2];
                    }
                    
                    
                    rAVC.bio = [athleteObjects objectAtIndex:0];
                    rAVC.athleteImageInput = [[athleteObjects objectAtIndex:0]objectForKey:@"image"];
                    
                    rAVC.haveRoster = self.haveRoster;
                    rAVC.teamRoster = self.teamRoster;
                    rAVC.teamName = self.teamName;
                    rAVC.longForm = self.longForm;
                    rAVC.incommingTeamURL = self.incommingTeamURL;
                    rAVC.backgroundImagePath = self.backgroundImagePath;
                    
                    rAVC.stories = self.stories;
                    rAVC.coaches = self.coaches;
                    rAVC.albums = self.albums;
                    rAVC.haveNews = self.haveNews;
                    rAVC.haveCoaches = self.haveCoaches;
                    rAVC.haveAlbums = self.haveAlbums;
                    
                    rAVC.schedBackground = self.schedBackground;
                    rAVC.imageBackground = self.imageBackground;
                }
            }
            
        }
    }
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   }
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
