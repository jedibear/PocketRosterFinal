//
//  ScheduleViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 5/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UIViewController



@property (nonatomic) BOOL *longForm, *haveSchedule;
@property (nonatomic) NSString  *teamName, *backgroundImagePath;
@property (nonatomic) NSString *incommingTeamURL;
@property (nonatomic) NSMutableDictionary *schedule;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@end
