//
//  RosterAthleteViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RosterAthleteViewController : UIViewController

//the properties store the state of each team
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath;
@property (nonatomic) NSMutableArray *teamLinks, *stories;
@property (nonatomic) NSMutableDictionary *teamRoster, *coaches, *albums;
@property (nonatomic) BOOL *longForm, *haveRoster, *haveNews, *haveCoaches, *haveAlbums;


@property (nonatomic) NSString *incommingURL;
@property (nonatomic) BOOL  *hasBioStory;
@property (nonatomic) NSString  *athleteName;
@property (nonatomic) NSString  *specs, *bioStory;
@property (nonatomic) UIImage *athleteImageInput;
@property (nonatomic) NSMutableDictionary  *bio;

@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;

@property (strong, nonatomic) IBOutlet UIImageView *athleteImage;
@property (strong, nonatomic) IBOutlet UILabel *athleteSpecs;
@property (strong, nonatomic) IBOutlet UILabel *athleteStory;
@property (strong, nonatomic) IBOutlet UITextView *bioTextHolder;

@end
