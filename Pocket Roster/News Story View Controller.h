//
//  News Story View Controller.h
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface News_Story_View_Controller : UIViewController

@property (nonatomic) NSString *newsURL, *team;
@property (strong, nonatomic) IBOutlet UILabel *storyTitle;

@property (nonatomic) NSString *teamName, *backgroundImagePath, *incommingTeamURL, *incTitle;
@property (nonatomic) NSString *newsURLInc;
@property (nonatomic) BOOL *longForm;


@end
