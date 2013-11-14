//
//  RosterAthleteViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosterAthleteViewController : UIViewController

@property (nonatomic) NSString *incommingURL;
@property (nonatomic) BOOL *longForm, *haveRoster;
@property (nonatomic) NSString *teamName, *backgroundImagePath;
@property (nonatomic) NSString *incommingTeamURL;
@property (nonatomic) UIImage *athleteImageInput;
@property (nonatomic) NSMutableDictionary *roster;

@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *athleteImage;

@end
