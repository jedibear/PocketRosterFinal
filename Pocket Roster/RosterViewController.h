//
//  RosterViewController.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/17/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosterViewController : UIViewController

@property (nonatomic) NSString *rosterURL, *teamName, *backgroundImagePath;
@property (nonatomic) NSString *incommingTeamURL;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;


@end
