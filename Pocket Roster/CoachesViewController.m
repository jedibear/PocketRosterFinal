//
//  CoachesViewController.m
//  Pocket Roster	
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import "CoachesViewController.h"
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

    //verify that the URL was passed
    NSLog(@"%@", self.coachesURL);
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
    }
}

@end
