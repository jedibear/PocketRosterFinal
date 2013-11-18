//
//  HomeImageViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeImageViewController : UIViewController

@property (nonatomic) NSString *incommingURL, *incommingTeamURL, *backgroundImagePath, *teamName;
@property (nonatomic) BOOL *haveRoster, *haveAlbum, *longForm, *haveNews, *haveFac;
@property (nonatomic) NSMutableDictionary *roster, *news, *albums, *facilities;

@end
