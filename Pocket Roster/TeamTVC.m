//
//  TeamTVC.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/3/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "TeamTVC.h"
#import "GetTeamLinks.h"
#import "Get_Data_From_Website.h"
#import "GetRosterBIO.h"
#import "RosterSplashVC.h"
#import "RosterViewController.h"
#import "ScheduleViewController.h"
#import "NewsFeedViewController.h"
#import "CoachesViewController.h"
#import "FacilitiesViewController.h"
#import "HomeImageViewController.h"

@interface TeamTVC ()

@end

@implementation TeamTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSMutableDictionary *) teamRoster{
    if(!_teamRoster){
        _teamRoster = [[NSMutableDictionary alloc] init];
    }
    return _teamRoster;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.teamLinks = [GetTeamLinks getTeamLinkBreakdown:self.incommingTeamURL];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 *
 *  Prepare the segue to the appropriate view the user is looking to navigate to. Right now
 *  just the incommingURL is passed. The specific naviagtion found above will have to be appended
 *  to a string to get the full URL to be passed. String will be converted to an actual URL in
 *  the destination view controller.
 *
 */




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"roster"]) {
	//not sure if this is the right class, nothing is in RosterViewController right now.         
	//football roster no longer works/ was using pics, need to pull from site
        
        
        if ([segue.destinationViewController isKindOfClass:[RosterSplashVC class]]) {
            
            RosterSplashVC *rVC = (RosterSplashVC *)segue.destinationViewController;

            if(!self.haveRoster){
                self.teamRoster = [Get_Data_From_Website getInfo:[self.teamLinks objectAtIndex:0]];
            }
            
            rVC.teamRoster = self.teamRoster;
            rVC.longForm = self.longForm;
            rVC.backgroundImagePath = self.backgroundImagePath;
            rVC.teamName = self.teamName;
            rVC.incommingTeamURL = self.incommingTeamURL;
            rVC.haveRoster = self.haveRoster;
            
            rVC.stories = self.stories;
            rVC.coaches = self.coaches;
            rVC.albums = self.albums;
            rVC.haveNews = self.haveNews;
            rVC.haveCoaches = self.haveCoaches;
            rVC.haveAlbums = self.haveAlbums;
            
            rVC.schedBackground = self.schedBackground;
            rVC.imageBackground = self.imageBackground;
        }
    }else if ([segue.identifier isEqualToString:@"schedule"]) {
        
        if ([segue.destinationViewController isKindOfClass:[ScheduleViewController class]]) {
            
            ScheduleViewController *sVC = (ScheduleViewController *)segue.destinationViewController;
            

            sVC.schedURL = [self.teamLinks objectAtIndex:1];
            sVC.incommingTeamURL = self.incommingTeamURL;
            sVC.teamRoster = self.teamRoster;
            sVC.longForm = self.longForm;
            sVC.teamName = self.teamName;
            sVC.backgroundImagePath = self.backgroundImagePath;
            sVC.haveRoster = self.haveRoster;
            
            sVC.stories = self.stories;
            sVC.coaches = self.coaches;
            sVC.albums = self.albums;
            sVC.haveNews = self.haveNews;
            sVC.haveCoaches = self.haveCoaches;
            sVC.haveAlbums = self.haveAlbums;
            
            sVC.schedBackground = self.schedBackground;
            sVC.imageBackground = self.imageBackground;
        }
    }else if ([segue.identifier isEqualToString:@"news"]) {
        
        if ([segue.destinationViewController isKindOfClass:[NewsFeedViewController class]]) {
            NewsFeedViewController *nFVC = (NewsFeedViewController *)segue.destinationViewController;
            if(self.longForm){
                nFVC.newsURL =[self.teamLinks objectAtIndex:3];
            }else{
                nFVC.newsURL = [self.teamLinks objectAtIndex:2];
            }
            nFVC.longForm = self.longForm;
            nFVC.backgroundImagePath = self.backgroundImagePath;
            nFVC.teamName = self.teamName;
            nFVC.incommingTeamURL = self.incommingTeamURL;
            nFVC.haveRoster = self.haveRoster;
            
            nFVC.teamRoster = self.teamRoster;
            nFVC.stories = self.stories;
            nFVC.coaches = self.coaches;
            nFVC.albums = self.albums;
            nFVC.haveNews = self.haveNews;
            nFVC.haveCoaches = self.haveCoaches;
            nFVC.haveAlbums = self.haveAlbums;
            
            nFVC.schedBackground = self.schedBackground;
            nFVC.imageBackground = self.imageBackground;
        }
    }else if ([segue.identifier isEqualToString:@"coaches"]) {
        
        if ([segue.destinationViewController isKindOfClass:[CoachesViewController class]]) {
            CoachesViewController *cVC = (CoachesViewController *)segue.destinationViewController;
        
        
            if (self.longForm) {
                cVC.coachesURL = [self.teamLinks objectAtIndex:4];
            }else{
                cVC.coachesURL = [self.teamLinks objectAtIndex:3];
            }
        
            cVC.incommingTeamURL = self.incommingTeamURL;
            cVC.longForm = self.longForm;
            cVC.haveRoster = self.haveRoster;
            cVC.backgroundImagePath = self.backgroundImagePath;
            cVC.teamName = self.teamName;
            cVC.teamRoster = self.teamRoster;
            
            cVC.stories = self.stories;
            cVC.coaches = self.coaches;
            cVC.albums = self.albums;
            cVC.haveNews = self.haveNews;
            cVC.haveCoaches = self.haveCoaches;
            cVC.haveAlbums = self.haveAlbums;
            
            cVC.schedBackground = self.schedBackground;
            cVC.imageBackground = self.imageBackground;
        
        }
    }else if ([segue.identifier isEqualToString:@"facilities"]) {
        
        if ([segue.destinationViewController isKindOfClass:[FacilitiesViewController class]]) {
            FacilitiesViewController *fVC = (FacilitiesViewController *)segue.destinationViewController;
            
            if (self.longForm) {
                fVC.facilitiesURL = [self.teamLinks objectAtIndex:5];
            }else{
                fVC.facilitiesURL = [self.teamLinks objectAtIndex:4];
            }
            
            fVC.incommingTeamURL = self.incommingTeamURL;
            fVC.longForm = self.longForm;
            fVC.haveRoster = self.haveRoster;
            fVC.backgroundImagePath = self.backgroundImagePath;
            fVC.teamName = self.teamName;
            fVC.teamRoster = self.teamRoster;
            
            fVC.stories = self.stories;
            fVC.coaches = self.coaches;
            fVC.albums = self.albums;
            fVC.haveNews = self.haveNews;
            fVC.haveCoaches = self.haveCoaches;
            fVC.haveAlbums = self.haveAlbums;
            
            fVC.schedBackground = self.schedBackground;
            fVC.imageBackground = self.imageBackground;
        
        }
    }else if ([segue.identifier isEqualToString:@"images"]) {
        
        if ([segue.destinationViewController isKindOfClass:[HomeImageViewController class]]) {
            HomeImageViewController *hIVC = (HomeImageViewController *)segue.destinationViewController;
            
            hIVC.incommingURL = self.incommingTeamURL;
            hIVC.incommingTeamURL= self.incommingTeamURL;
            hIVC.backgroundImagePath = self.backgroundImagePath;
            hIVC.teamName = self.teamName;
            hIVC.haveRoster = self.haveRoster;
            hIVC.longForm = self.longForm;
            
            hIVC.teamRoster = self.teamRoster;
            hIVC.stories = self.stories;
            hIVC.coaches = self.coaches;
            hIVC.albums = self.albums;
            hIVC.haveNews = self.haveNews;
            hIVC.haveCoaches = self.haveCoaches;
            hIVC.haveAlbums = self.haveAlbums;
            
            hIVC.schedBackground = self.schedBackground;
            hIVC.imageBackground = self.imageBackground;
           
        }
    }
}    


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
