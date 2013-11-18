//
//  CoachesTVC.h
//  Pocket Roster	
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoachesTVC : UITableViewController

@property (nonatomic) NSString *coachesURL, *teamName, *backgroundImagePath, *incommingTeamURL;
@property (nonatomic) BOOL *haveRoster, *longForm;
@property (nonatomic) NSMutableDictionary *coaches, *roster;



@end
