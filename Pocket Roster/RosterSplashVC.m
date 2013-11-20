//
//  RosterSplashVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/14/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "RosterSplashVC.h"
#import "GetRosterBIO.h"
#import "RosterViewController.h"


@interface RosterSplashVC ()

@end

@implementation RosterSplashVC

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
    
    
    
        customProgressView = [[CustomProgressView alloc] init];
        customProgressView.delegate = self;
        [self.view addSubview:customProgressView];
    
        // Do any additional setup after loading the view.
        [self.teamNameLabel setText: self.teamName];
        [self.teamBackgroundImage setImage:[[UIImage alloc] initWithContentsOfFile:self.backgroundImagePath]];
    
   
    
    /*
    
    
    */
    
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //self.queue = [NSOperationQueue new];
   // NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(getAthleteBios) object:nil];
    //[self.queue addOperation:operation];
    [self performSelectorInBackground:@selector(getAthleteBios) withObject:nil];
    //operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(updateProgressBar) object:nil];
    //[self.queue addOperation:operation];
}

- (NSMutableDictionary *) rosterBios{
    if(!_rosterBios){
        _rosterBios = [[NSMutableDictionary alloc] init];
    }
    return _rosterBios;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (void)getAthleteBios{
    
    if (self.haveRoster) {
        [self performSegueWithIdentifier:@"continue" sender:self];
    }else{
    
    self.picturesDone = NO;
    for (int i = 0; i < [self.teamRoster count]; i++) {
        
        
        self.key = [[NSString alloc] initWithFormat:@"%d", i+1];
        self.rosterBios = [GetRosterBIO getBio:[[self.teamRoster objectForKey:self.key] objectAtIndex:0]];
        
        self.progress = [NSNumber numberWithFloat:(float)i/(float)([self.teamRoster count]-1)];
        
        [[self.teamRoster objectForKey:self.key]setObject:self.rosterBios atIndex:0];
        [customProgressView performSelectorOnMainThread:@selector(setProgress:) withObject:self.progress waitUntilDone:YES];
    }
    self.picturesDone = YES;
    self.haveRoster = YES;
    
    [self performSegueWithIdentifier:@"continue" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"continue"]) {
        if ([segue.destinationViewController isKindOfClass:[RosterViewController class]]) {
            RosterViewController *rVC = (RosterViewController *)segue.destinationViewController;
            rVC.teamRoster = self.teamRoster;
            rVC.longForm = self.longForm;
            rVC.incommingTeamURL = self.incommingTeamURL;
            rVC.teamName = self.teamName;
            rVC.backgroundImagePath = self.backgroundImagePath;
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
    }
}

@end
