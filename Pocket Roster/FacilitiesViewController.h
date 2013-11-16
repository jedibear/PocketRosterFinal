//
//  FacilitiesViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FacilitiesViewController : UIViewController

@property (nonatomic) NSString *facilitiesURL, *incommingTeamURL, *teamName;
@property (nonatomic) NSString *backgroundImagePath;
@property (nonatomic) BOOL *longForm, *haveRoster;
@property (nonatomic) NSMutableDictionary *teamRoster;

@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;


@end
