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
    self.load = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    
    
    
}
- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.load startAnimating];
    
    self.facility = [GetFacility GetFacility:self.facilitiesURL];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
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
   if ([segue.identifier isEqualToString:@"back2TVC"]){
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *tVC = (TeamViewController *)segue.destinationViewController;
            
            tVC.teamName = self.teamName;
            tVC.teamRoster = self.teamRoster;
            tVC.backgroundImagePath = self.backgroundImagePath;
            tVC.haveRoster = self.haveRoster;
            tVC.longForm = self.longForm;
            tVC.incommingTeamURL = self.incommingTeamURL;
            
            tVC.stories = self.stories;
            tVC.coaches = self.coaches;
            tVC.albums = self.albums;
            tVC.haveNews = self.haveNews;
            tVC.haveCoaches = self.haveCoaches;
            tVC.haveAlbums = self.haveAlbums;
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
