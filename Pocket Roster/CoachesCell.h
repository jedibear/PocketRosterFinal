//
//  CoachesCell.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/16/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoachesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *coachesName;
@property (strong, nonatomic) IBOutlet UILabel *coachesPosition;
@property (strong, nonatomic) IBOutlet UILabel *coachesPhone;
@property (strong, nonatomic) IBOutlet UILabel *coachesEmail;

@end
