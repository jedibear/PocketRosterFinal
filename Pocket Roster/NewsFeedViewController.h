//
//  NewsFeedViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeedViewController : UIViewController

@property (nonatomic) NSString *teamName, *backgroundImagePath, *incommingTeamURL;
@property (nonatomic) NSString *newsURL;
@property (nonatomic) BOOL *longForm;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@end
