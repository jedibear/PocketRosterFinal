//
//  RosterTVC.h
//  Pocket Roster
//
//  Created by James P. Garvey on 4/20/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosterTVC : UITableViewController

@property (nonatomic) NSString *key;
@property (nonatomic, strong) NSMutableDictionary *teamRoster;


@property (nonatomic) BOOL *longForm;
@property (nonatomic) NSString  *teamName, *backgroundImagePath;
@property (nonatomic) NSString *incommingTeamURL;
@property (nonatomic) UIImage *athleteImage;

@end
