//
//  ScoreboardViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/15/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ScoreboardViewController.h"
#import "ScoreboardTVC.h"

@interface ScoreboardViewController ()

@end

@implementation ScoreboardViewController

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
    
    self.incommingScoreboardURL = @"http://http://athletics.bowdoin.edu/landing/index";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"embedScoreboard"]) {
        
        if ([segue.destinationViewController isKindOfClass:[ScoreboardTVC class]]) {
            
            ScoreboardTVC *sTVC = (ScoreboardTVC *)segue.destinationViewController;
            sTVC.incommingScheduleURL = self.incommingScoreboardURL;
        }
    }
    
}

@end
