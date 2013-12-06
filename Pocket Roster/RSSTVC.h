//
//  RSSTVC.h
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WebViewController.h"

@interface RSSTVC : UITableViewController <NSXMLParserDelegate>

//the properties store the state of each team
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath, *schedBackground, *imageBackground;
@property (nonatomic) NSMutableArray *teamLinks, *stories;
@property (nonatomic) NSMutableDictionary *teamRoster, *coaches, *albums;
@property (nonatomic) BOOL *longForm, *haveRoster, *haveNews, *haveCoaches, *haveAlbums;


@property (nonatomic) NSMutableDictionary *item;
@property (nonatomic) NSMutableString *currentTitle, *currentDate, *currentSummary, *currentLink, *imageURL, *sequeLink;
@property (nonatomic) NSString *currentElement,  *incommingURL;
@property (nonatomic) UIImage *storyImage;


@property (nonatomic) NSString *newsURL;




- (void) setTeamName:(NSString *)teamName;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *load;


@end
