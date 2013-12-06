//
//  News Story View Controller.h
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface News_Story_View_Controller : UIViewController

//the properties store the state of each team
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath, *schedBackground, *imageBackground;
@property (nonatomic) NSMutableArray *teamLinks, *stories;
@property (nonatomic) NSMutableDictionary *teamRoster, *coaches, *albums;
@property (nonatomic) BOOL *longForm, *haveRoster, *haveNews, *haveCoaches, *haveAlbums;

@property (nonatomic) NSString *newsURL, *team;
@property (strong, nonatomic) IBOutlet UILabel *storyTitle;

@property (nonatomic) NSString *incTitle;
@property (nonatomic) NSString *newsURLInc, *segueLink;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSMutableDictionary *story;
@property (strong, nonatomic) IBOutlet UIImageView *storyImage;
@property (strong, nonatomic) IBOutlet UITextView *storyBody;
@property (strong, nonatomic) IBOutlet UILabel *storyCaption;

@end
