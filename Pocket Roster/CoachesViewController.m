//
//  CoachesViewController.m
//  Pocket Roster	
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import "CoachesViewController.h"
#import "TeamViewController.h"
#import "GetCoaches.h"
#import "CoachesTVC.h"

@interface CoachesViewController ()

@end

@implementation CoachesViewController

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
    //verify that the URL was passed
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//segue for embeded coaches TVC
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"embedCoaches"]) {
        if ([segue.destinationViewController isKindOfClass:[CoachesTVC class]]) {
            CoachesTVC *cTVC = (CoachesTVC *)segue.destinationViewController;
            cTVC.coachesURL = self.coachesURL;
        }
    }else if ([segue.identifier isEqualToString:@"back2TVC"]){
        NSLog(@"HERE");
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            
            TeamViewController *tVC = (TeamViewController *)segue.destinationViewController;
            
            tVC.teamName = self.teamName;
            tVC.teamRoster = self.teamRoster;
            tVC.longForm = self.longForm;
            tVC.backgroundImagePath = self.backgroundImagePath;
            tVC.incommingTeamURL = self.incommingTeamURL;
            tVC.haveRoster = self.haveRoster;
        }
    }
}

@end
