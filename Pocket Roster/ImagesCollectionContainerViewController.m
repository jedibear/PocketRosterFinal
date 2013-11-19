//
//  ImagesCollectionContainerViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ImagesCollectionContainerViewController.h"
#import "HomeImageViewController.h"
#import "CollectionImageViewController.h"
#import "GetImages.h"

@interface ImagesCollectionContainerViewController ()

@end

@implementation ImagesCollectionContainerViewController

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
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"embedPhotos"]) {
        if ([segue.destinationViewController isKindOfClass:[CollectionImageViewController class]]) {
            CollectionImageViewController *rAVC = (CollectionImageViewController *)segue.destinationViewController;
            
            rAVC.incAlbum = self.incAlbum;
            rAVC.incommingURL = self.incommingURL;
            
            rAVC.incommingURL = self.incommingTeamURL;
            rAVC.incommingTeamURL= self.incommingTeamURL;
            rAVC.backgroundImagePath = self.backgroundImagePath;
            rAVC.teamName = self.teamName;
            rAVC.haveRoster = self.haveRoster;
            rAVC.longForm = self.longForm;
            
            rAVC.teamRoster = self.teamRoster;
            rAVC.stories = self.stories;
            rAVC.coaches = self.coaches;
            rAVC.albums = self.albums;
            rAVC.haveNews = self.haveNews;
            rAVC.haveCoaches = self.haveCoaches;
            rAVC.haveAlbums = self.haveAlbums;
            
            
        }
    }else if([segue.identifier isEqualToString:@"back2Albums"]){
        if([segue.destinationViewController isKindOfClass:[HomeImageViewController class]]){
            
            HomeImageViewController *hVC = (HomeImageViewController *)segue.destinationViewController;
            
            hVC.incommingURL = self.incommingURL;
            
            hVC.incommingURL = self.incommingTeamURL;
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
        }
    }
}

@end
