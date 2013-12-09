//
//  NewsFeedViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "TeamViewController.h"
#import "RSSTVC.h"

@interface NewsFeedViewController ()

@end

@implementation NewsFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.teamNameLabel setText:self.teamName];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedNews"]) {
       
        
        if([segue.destinationViewController isKindOfClass:[RSSTVC class]]){
            
            RSSTVC *rSSTmp = (RSSTVC *)segue.destinationViewController;
            
            
            if (!self.incommingTeamURL) {
                self.newsURL = @"http://athletics.bowdoin.edu/landing/headlines-featured?feed=rss_2.0";
            }
            
            
            rSSTmp.backgroundImagePath = self.backgroundImagePath;
            rSSTmp.longForm = self.longForm;
            rSSTmp.teamName = self.teamName;
            rSSTmp.newsURL = self.newsURL;
            rSSTmp.incommingTeamURL = self.incommingTeamURL;
            rSSTmp.teamRoster = self.teamRoster;
            
            rSSTmp.stories = self.stories;
            rSSTmp.coaches = self.coaches;
            rSSTmp.albums = self.albums;
            rSSTmp.haveNews = self.haveNews;
            rSSTmp.haveCoaches = self.haveCoaches;
            rSSTmp.haveAlbums = self.haveAlbums;
            rSSTmp.haveRoster = self.haveRoster;
            
            rSSTmp.schedBackground = self.schedBackground;
            rSSTmp.imageBackground = self.imageBackground;
            
        }
        
    }else if([segue.identifier isEqualToString:@"back2TVC"]){
            if([segue.destinationViewController isKindOfClass:[TeamViewController class]]){
                TeamViewController *tVC = (TeamViewController *)segue.destinationViewController;
                tVC.teamName = self.teamName;
                tVC.longForm = self.longForm;
                tVC.backgroundImagePath = self.backgroundImagePath;
                tVC.incommingTeamURL = self.incommingTeamURL;
                
                
                tVC.teamRoster = self.teamRoster;
                tVC.stories = self.stories;
                tVC.coaches = self.coaches;
                tVC.albums = self.albums;
                tVC.haveNews = self.haveNews;
                tVC.haveCoaches = self.haveCoaches;
                tVC.haveAlbums = self.haveAlbums;
                tVC.haveRoster = self.haveRoster;
                
                tVC.schedBackground = self.schedBackground;
                tVC.imageBackground = self.imageBackground;
            }
        }
}

@end
