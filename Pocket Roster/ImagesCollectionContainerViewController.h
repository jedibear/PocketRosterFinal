//
//  ImagesCollectionContainerViewController.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagesCollectionContainerViewController : UIViewController

//the properties store the state of each team
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath, *schedBackground, *imageBackground, *saveKey;
@property (nonatomic) NSMutableArray *teamLinks, *stories;
@property (nonatomic) NSMutableDictionary *teamRoster, *coaches, *albums;
@property (nonatomic) BOOL *longForm, *haveRoster, *haveNews, *haveCoaches, *haveAlbums;


@property (nonatomic) NSMutableDictionary *incAlbum;
@property (nonatomic) NSString *incommingURL, *albumTitle, *imageURL;

@end
