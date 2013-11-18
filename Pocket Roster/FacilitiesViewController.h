//
//  FacilitiesViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FacilitiesViewController : UIViewController

@property (nonatomic) NSString *facilitiesURL, *incommingTeamURL, *teamName;
@property (nonatomic) NSString *backgroundImagePath;
@property (nonatomic) BOOL *longForm, *haveRoster;
@property (nonatomic) NSMutableDictionary *teamRoster, *facility;
@property (nonatomic) NSMutableArray *images;
@property (nonatomic) NSUInteger *imageIndex;

@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *facilityName;

@property (strong, nonatomic) IBOutlet UIImageView *facilityImage;
@property (strong, nonatomic) IBOutlet UITextView *facilityText;
- (IBAction)nextImage:(UIButton *)sender;
- (IBAction)previousImage:(UIButton *)sender;

@end
