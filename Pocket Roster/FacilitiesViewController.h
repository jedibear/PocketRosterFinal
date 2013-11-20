//
//  FacilitiesViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FacilitiesViewController : UIViewController

//the properties store the state of each team
@property (nonatomic) NSString *incommingTeamURL, *teamName, *backgroundImagePath, *schedBackground, *imageBackground;
@property (nonatomic) NSMutableArray *teamLinks, *stories;
@property (nonatomic) NSMutableDictionary *teamRoster, *coaches, *albums;
@property (nonatomic) BOOL *longForm, *haveRoster, *haveNews, *haveCoaches, *haveAlbums;

@property (nonatomic) NSString *facilitiesURL;
@property (nonatomic) NSMutableDictionary *facility;
@property (nonatomic) NSMutableArray *images;
@property (nonatomic) NSUInteger *imageIndex;



@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *facilityName;


@property (strong, nonatomic) IBOutlet UIImageView *facilityImage;
@property (strong, nonatomic) IBOutlet UITextView *facilityText;

- (IBAction)nextImage:(UIButton *)sender;
- (IBAction)previousImage:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *load;



@end
