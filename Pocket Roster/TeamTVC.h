//
//  TeamTVC.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/3/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamTVC : UITableViewController

@property (nonatomic) NSString *incommingTeamURL;
@property (nonatomic) NSString *teamName, *backgroundImagePath;
@property (nonatomic) NSMutableArray *teamLinks;

@end
