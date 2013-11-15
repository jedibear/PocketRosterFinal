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
@property (nonatomic) BOOL *longForm, *haveRoster, *hasBioStory;
@property (nonatomic) NSString *teamName, *backgroundImagePath, *athleteName;
@property (nonatomic) NSString *incommingTeamURL, *specs, *bioStory;
@property (nonatomic) UIImage *athleteImageInput;
@property (nonatomic) NSMutableDictionary *roster, *bio;

@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *athleteImage;
@property (strong, nonatomic) IBOutlet UILabel *athleteSpecs;
@property (strong, nonatomic) IBOutlet UILabel *athleteStory;

@end
