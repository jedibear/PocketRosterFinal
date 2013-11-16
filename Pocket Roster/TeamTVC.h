//
//  TeamTVC.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/3/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamTVC : UITableViewController

@property (nonatomic) NSString *incommingTeamURL, *key, *schedURL;
@property (nonatomic) NSString *teamName, *backgroundImagePath;
@property (nonatomic) NSMutableArray *teamLinks;
@property (nonatomic) NSMutableDictionary *teamRoster, *teamRosterBios;
@property (nonatomic) BOOL *longForm, *haveRoster;





@end
