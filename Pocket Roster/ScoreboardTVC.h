//
//  ScoreboardTVC.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/15/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreboardTVC : UITableViewController

@property (nonatomic) NSString *incommingScheduleURL;
@property (nonatomic) NSMutableDictionary *scoreboard;

- (void) refresh: (UIRefreshControl *)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;

@end
