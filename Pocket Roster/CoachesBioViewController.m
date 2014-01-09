//
//  CoachesBioViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/17/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "CoachesBioViewController.h"
#import "CoachesViewController.h"

@interface CoachesBioViewController ()

@end

@implementation CoachesBioViewController

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
    
    [self.athleteImage setImage:self.athleteImageInput];
    
    
    [self.teamNameLabel setText:self.athleteName];
	// Do any additional setup after loading the view.
    
    self.hasBioStory = NO;
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    
    [self.bio enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
        if ([key isEqualToString:@"bio"]) {
            self.bioStory = [[NSString alloc]initWithString:obj];
            self.hasBioStory = YES;
            
        }else if (![key isEqualToString:@"image"]) {
            [tmp addObject:[NSString stringWithFormat:@"%@: %@", key, obj]];
        }
    }];
    
    if (self.hasBioStory){
        [self.bioTextHolder setText:self.bioStory];
    }
    
    self.specs = [tmp componentsJoinedByString:@"\r"];
    
    [self.athleteSpecs setText:self.specs];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"back2Coaches"]) {
        
        if ([segue.destinationViewController isKindOfClass:[CoachesViewController class]]) {
            CoachesViewController *rVC = (CoachesViewController *)segue.destinationViewController;
            
            rVC.incommingTeamURL = self.incommingTeamURL;
            rVC.longForm = self.longForm;
            rVC.haveRoster = self.haveRoster;
            rVC.backgroundImagePath = self.backgroundImagePath;
            rVC.teamRoster = self.teamRoster;
            rVC.teamName = self.teamName;
            rVC.coachesURL = self.incommingURL;
            
            
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
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
