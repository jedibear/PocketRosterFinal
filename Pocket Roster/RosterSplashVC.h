//
//  RosterSplashVC.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/14/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomProgressView.h"

@interface RosterSplashVC : UIViewController <CustomProgressViewDelegate>{
    CustomProgressView *customProgressView;
}

//the properties store the state of each team
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath, *schedBackground, *imageBackground;
@property (nonatomic) NSMutableArray *teamLinks, *stories;
@property (nonatomic) NSMutableDictionary *teamRoster, *coaches, *albums;
@property (nonatomic) BOOL *longForm, *haveRoster, *haveNews, *haveCoaches, *haveAlbums;


@property (nonatomic) NSMutableDictionary *rosterBios;
@property (nonatomic) BOOL *picturesDone;
@property (nonatomic) NSString  *key;
@property (nonatomic) NSNumber *progress;
@property (strong, nonatomic) IBOutlet UIImageView *teamBackgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (nonatomic) NSOperationQueue *queue;



- (void) getAthleteBios;
@end
