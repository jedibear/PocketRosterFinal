//
//  ImageViewController.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

//the properties store the state of each team
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath, *schedBackground, *imageBackground;
@property (nonatomic) NSMutableArray *teamLinks, *stories;
@property (nonatomic) NSMutableDictionary *teamRoster, *coaches, *albums;
@property (nonatomic) BOOL *longForm, *haveRoster, *haveNews, *haveCoaches, *haveAlbums;

@property (nonatomic, strong) NSString *incommingURL, *imageURL;
@property (strong, nonatomic) IBOutlet UIImageView *zoomedImage;
@property (nonatomic) UIImage *incImage;


@property (nonatomic) NSMutableDictionary *incAlbum;

@end
