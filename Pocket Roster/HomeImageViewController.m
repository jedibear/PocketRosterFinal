//
//  HomeImageViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "HomeImageViewController.h"
#import "HomeImageTVC.h"
#import "TeamViewController.h"
#import "GetImages.h"

@interface HomeImageViewController ()

@end

@implementation HomeImageViewController

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
    
    [self.imagePicBackground setImage:[[UIImage alloc] initWithContentsOfFile:self.imageBackground]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"embedAlbums"]){
        
        if([segue.destinationViewController isKindOfClass:[HomeImageTVC class]]){
            HomeImageTVC *hVC = (HomeImageTVC *)segue.destinationViewController;
            
            hVC.inputURL = self.incommingURL;
            
            hVC.incommingURL = self.incommingURL;
            hVC.incommingTeamURL= self.incommingTeamURL;
            hVC.backgroundImagePath = self.backgroundImagePath;
            hVC.teamName = self.teamName;
            hVC.haveRoster = self.haveRoster;
            hVC.longForm = self.longForm;
            
            hVC.teamRoster = self.teamRoster;
            hVC.stories = self.stories;
            hVC.coaches = self.coaches;
            hVC.albums = self.albums;
            hVC.haveNews = self.haveNews;
            hVC.haveCoaches = self.haveCoaches;
            hVC.haveAlbums = self.haveAlbums;
            
            hVC.schedBackground = self.schedBackground;
            hVC.imageBackground = self.imageBackground;
        }
    }else if([segue.identifier isEqualToString:@"back2TVC"]){
        
        
        if([segue.destinationViewController isKindOfClass:[TeamViewController class]]){
            
            TeamViewController *hVC = (TeamViewController *)segue.destinationViewController;
            
            
            hVC.incommingTeamURL= self.incommingTeamURL;
            hVC.backgroundImagePath = self.backgroundImagePath;
            hVC.teamName = self.teamName;
            hVC.haveRoster = self.haveRoster;
            hVC.longForm = self.longForm;
            
            hVC.teamRoster = self.teamRoster;
            hVC.stories = self.stories;
            hVC.coaches = self.coaches;
            hVC.albums = self.albums;
            hVC.haveNews = self.haveNews;
            hVC.haveCoaches = self.haveCoaches;
            hVC.haveAlbums = self.haveAlbums;
            
            hVC.schedBackground = self.schedBackground;
            hVC.imageBackground = self.imageBackground;
            
        }
    }
    
}



@end
