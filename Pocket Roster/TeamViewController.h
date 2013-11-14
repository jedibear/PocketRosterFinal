//
//  TeamViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamViewController : UIViewController

@property (nonatomic) NSString *teamName, *backgroundImagePath;
@property (nonatomic) NSString *incommingTeamURL;
@property (nonatomic) NSMutableArray *teamLinks;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *teamBackgroundImage;
@property (nonatomic) BOOL *longForm, *haveRoster;
@property (nonatomic) NSMutableDictionary *teamRoster;

-(void)setTeamName:(NSString *)team;

@end
