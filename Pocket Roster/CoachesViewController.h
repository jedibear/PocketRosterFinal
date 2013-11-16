//
//  CoachesViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoachesViewController : UIViewController

@property (nonatomic) NSString *coachesURL, *incommingTeamURL, *teamName, *backgroundImagePath;
@property (nonatomic) BOOL *haveRoster, *longForm;
@property (nonatomic) NSMutableDictionary *teamRoster;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;

@end
