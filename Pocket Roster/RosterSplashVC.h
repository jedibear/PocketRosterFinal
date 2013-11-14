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


@property (nonatomic) NSMutableDictionary *roster, *rosterBios;
@property (nonatomic) BOOL *longForm, *picturesDone, *haveRoster;
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath, *key;
@property (nonatomic) NSNumber *progress;
@property (strong, nonatomic) IBOutlet UIImageView *teamBackgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (nonatomic) NSOperationQueue *queue;



- (void) getAthleteBios;
@end
