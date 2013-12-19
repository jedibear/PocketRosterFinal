//
//  ScheduleViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ScheduleViewController.h"
#import "TeamViewController.h"
#import "ScheduleTVC.h"
#import "GetSchedule.h"

@interface ScheduleViewController ()

@end

@implementation ScheduleViewController

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
    [self.backgroundImage setImage:[[UIImage alloc] initWithContentsOfFile:self.schedBackground]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"back2TVC"])
    {
        
        if([segue.destinationViewController isKindOfClass:[TeamViewController class]])
        {
            
			TeamViewController *sVC = (TeamViewController *)segue.destinationViewController;
            sVC.incommingTeamURL = self.incommingTeamURL;
            sVC.longForm = self.longForm;
            sVC.haveRoster = self.haveRoster;
            sVC.teamName = self.teamName;
            sVC.backgroundImagePath = self.backgroundImagePath;
            
            sVC.stories = self.stories;
            sVC.coaches = self.coaches;
            sVC.albums = self.albums;
            sVC.haveNews = self.haveNews;
            sVC.haveCoaches = self.haveCoaches;
            sVC.haveAlbums = self.haveAlbums;
            sVC.teamRoster = self.teamRoster;
            
            sVC.schedBackground = self.schedBackground;
            sVC.imageBackground = self.imageBackground;
            
        }
    
    }else if ([segue.identifier isEqualToString:@"embedSchedule"]){
        
        if([segue.destinationViewController isKindOfClass:[ScheduleTVC class]]){
            
            ScheduleTVC *sTVC = (ScheduleTVC *)segue.destinationViewController;
            
            sTVC.schedURL = self.schedURL;
            
        }
    }
    
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
