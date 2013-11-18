//
//  FacilitiesViewController.m
//  Pocket Roster 
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import "FacilitiesViewController.h"
#import "TeamViewController.h"
#import "FacilitiesTVC.h"
#import "GetFacility.h"

@interface FacilitiesViewController ()

@end

@implementation FacilitiesViewController

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
    
    self.imageIndex = 0;
    
    [self.teamNameLabel setText:self.teamName];
    
    self.facility = [GetFacility GetFacility:self.facilitiesURL];
    self.images = [self.facility objectForKey:@"images"];
    [self.facilityName setText:[self.facility objectForKey:@"Name"]];
    [self.facilityImage setImage:[self.images objectAtIndex:self.imageIndex]];
    [self.facilityText setText:[self.facility objectForKey:@"facilitiesText"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//segue for embeded coaches TVC
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"embedFacilities"]) {
        if ([segue.destinationViewController isKindOfClass:[FacilitiesTVC class]]) {
            FacilitiesTVC *fTVC = (FacilitiesTVC *)segue.destinationViewController;
            fTVC.facilitiesURL = self.facilitiesURL;
        }
    }else if ([segue.identifier isEqualToString:@"back2TVC"]){
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *tVC = (TeamViewController *)segue.destinationViewController;
            
            tVC.teamName = self.teamName;
            tVC.teamRoster = self.teamRoster;
            tVC.backgroundImagePath = self.backgroundImagePath;
            tVC.haveRoster = self.haveRoster;
            tVC.longForm = self.longForm;
            tVC.incommingTeamURL = self.incommingTeamURL;
        }
    }else if ([segue.identifier isEqualToString:@"readOn"]){
        if([segue.destinationViewController isKindOfClass:[FacilitiesViewController class]]){
            FacilitiesViewController *fVC = (FacilitiesViewController *)segue.destinationViewController;
            
            fVC.teamRoster = self.teamRoster;
            fVC.teamName = self.teamName;
            fVC.backgroundImagePath = self.backgroundImagePath;
            fVC.haveRoster = self.haveRoster;
            fVC.longForm = self.longForm;
            fVC.incommingTeamURL = self.incommingTeamURL;
        }
    }else if ([segue.identifier isEqualToString:@"back2Facilities"]){
        if ([segue.destinationViewController isKindOfClass:[FacilitiesViewController class]]) {
            FacilitiesViewController *fVC = (FacilitiesViewController *)segue.destinationViewController;
            
            fVC.teamRoster = self.teamRoster;
            fVC.teamName = self.teamName;
            fVC.backgroundImagePath = self.backgroundImagePath;
            fVC.haveRoster = self.haveRoster;
            fVC.longForm = self.longForm;
            fVC.incommingTeamURL = self.incommingTeamURL;
        }
    }
}

- (IBAction)nextImage:(UIButton *)sender {
    
    
    int index = self.imageIndex;
    NSLog(@"%dNEXT",index);
    if (index == [self.images count]-1) {
        self.imageIndex = 0;
    }else{
        self.imageIndex = index+1;
    }
    
    [self.facilityImage setImage:[self.images objectAtIndex:self.imageIndex]];
    
}

- (IBAction)previousImage:(UIButton *)sender {
    
    int index = self.imageIndex;
    NSLog(@"%dPREV", index);
    if (index == 0) {
        self.imageIndex = [self.images count]-1;
    }else{
        self.imageIndex = index - 1;
    }
    
    [self.facilityImage setImage:[self.images objectAtIndex:self.imageIndex]];
    
}
@end
