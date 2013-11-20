//
//  News Story View Controller.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "News Story View Controller.h"
#import "NewsFeedViewController.h"
#import "WebViewController.h"

@interface News_Story_View_Controller ()

@end

@implementation News_Story_View_Controller

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
    [self.storyTitle setText:self.incTitle];
	// Do any additional setup after loading the view.
    
    NSString *articleURL = [self.newsURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSLog(@"%@", articleURL);
    NSURL *url = [NSURL URLWithString:articleURL];
    //NSLog(@"%@", url);
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //NSLog(@"%@", requestObj);
    [self.webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"back2NFVC"]){
        NSLog(@"back");
        if ([segue.destinationViewController isKindOfClass:[NewsFeedViewController class]]) {
            
            NewsFeedViewController *nFVC = (NewsFeedViewController *)segue.destinationViewController;
            nFVC.teamName = self.team;
            nFVC.longForm = self.longForm;
            nFVC.backgroundImagePath = self.backgroundImagePath;
            nFVC.newsURL = self.newsURLInc;
            nFVC.incommingTeamURL = self.incommingTeamURL;
            
            nFVC.teamRoster = self.teamRoster;
            nFVC.stories = self.stories;
            nFVC.coaches = self.coaches;
            nFVC.albums = self.albums;
            nFVC.haveNews = self.haveNews;
            nFVC.haveCoaches = self.haveCoaches;
            nFVC.haveAlbums = self.haveAlbums;
            nFVC.haveRoster = self.haveRoster;
            
            nFVC.schedBackground = self.schedBackground;
            nFVC.imageBackground = self.imageBackground;
        }
        
    }
}

@end
