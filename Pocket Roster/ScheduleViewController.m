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
    NSLog(@"%@ sched",self.incommingTeamURL);
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
            
        }
    
    }else if ([segue.identifier isEqualToString:@"embedSchedule"]){
        
        if([segue.destinationViewController isKindOfClass:[ScheduleTVC class]]){
            
            ScheduleTVC *sTVC = (ScheduleTVC *)segue.destinationViewController;
            
            sTVC.schedURL = self.schedURL;
            
        }
    }
    
    
}

@end
