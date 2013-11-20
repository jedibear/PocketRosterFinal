//
//  ScheduleViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 5/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UIViewController
//the properties store the state of each team
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath, *schedBackground, *imageBackground;
@property (nonatomic) NSMutableArray *teamLinks, *stories;
@property (nonatomic) NSMutableDictionary *teamRoster, *coaches, *albums;
@property (nonatomic) BOOL *longForm, *haveRoster, *haveNews, *haveCoaches, *haveAlbums;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;


@property (nonatomic) NSString  *schedURL;
@property (nonatomic) NSMutableDictionary *schedule;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@end
