//
//  Pocket_RosterViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "Pocket_RosterViewController.h"
#import "Get_Data_From_Website.h"
#import "GetTeamLinks.h"
#import "GetImages.h"
#import "GetFacility.h"
#import "GetCoaches.h"
#import "GetSchedule.h"

@interface Pocket_RosterViewController ()

@end

@implementation Pocket_RosterViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
       // I think there is a memory leak????? Need to be fixed
    //[GetCoaches getCoachesInfo];
    //[Get_Data_From_Website getInfo];
    //[GetTeamLinks getTeamLinkBreakdown];
    //[GetImages getMostRecentImages];
    
    //Finished
    //[GetSchedule getSchedule];
    //[GetFacility GetFacility];

}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
