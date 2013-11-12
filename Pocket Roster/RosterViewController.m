//
//  RosterViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/17/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "RosterViewController.h"
#import "TeamViewController.h"
#import "RosterTVC.h"
#import "Get_Data_From_Website.h"

@interface RosterViewController ()


@end

@implementation RosterViewController


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
    NSLog(@"%@ fuck", self.rosterURL);
    
    [self.teamNameLabel setText:self.teamName];
	// Do any additional setup after loading the view.
    
    //[Get_Data_From_Website getInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

	if([segue.identifier isEqualToString:@"embedRoster"]){
		if([segue.destinationViewController isKindOfClass:[RosterTVC class]]){
			RosterTVC *rTVC = (RosterTVC *)segue.destinationViewController;
			rTVC.incommingURL = self.rosterURL;
		}
	}else if([segue.identifier isEqualToString:@"back2TVC"]){
        if([segue.destinationViewController isKindOfClass:[TeamViewController class]]){
            TeamViewController *tVC = (TeamViewController *)segue.destinationViewController;
            tVC.teamName = self.teamName;
            tVC.longForm = self.longForm;
            tVC.backgroundImagePath = self.backgroundImagePath;
            tVC.incommingTeamURL = self.incommingTeamURL;
        }
    }


}

@end
