//
//  RosterAthleteViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "RosterAthleteViewController.h"
#import "RosterViewController.h"

@interface RosterAthleteViewController ()

@end

@implementation RosterAthleteViewController

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
    [self.athleteImage setImage:self.athleteImageInput];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"back2Roster"]) {
        
        if ([segue.destinationViewController isKindOfClass:[RosterViewController class]]) {
            RosterViewController *rVC = (RosterViewController *)segue.destinationViewController;
            
            rVC.incommingTeamURL = self.incommingTeamURL;
            rVC.longForm = self.longForm;
            rVC.haveRoster = self.haveRoster;
            rVC.backgroundImagePath = self.backgroundImagePath;
            rVC.roster = self.roster;
            rVC.teamName = self.teamName;
            
        }
    }
}


@end
