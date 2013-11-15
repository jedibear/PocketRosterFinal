//
//  ScheduleViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ScheduleViewController.h"
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"back2Schedule"])
    {
        
        if([segue.destinationViewController isKindOfClass:[ScheduleViewController class]])
        {
			ScheduleViewController *sVC = (ScheduleViewController *)segue.destinationViewController;
            sVC.incommingTeamURL = self.incommingTeamURL;
            sVC.longForm = self.longForm;
            sVC.haveSchedule = self.haveSchedule;
            sVC.teamName = self.teamName;
            sVC.backgroundImagePath = self.backgroundImagePath;
            sVC.incommingTeamURL = self.incommingTeamURL;
        }
    
    }
    
    
}

@end
