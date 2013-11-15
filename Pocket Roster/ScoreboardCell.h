//
//  ScoreboardCell.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/15/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreboardCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *sportLabel;
@property (strong, nonatomic) IBOutlet UILabel *team1;
@property (strong, nonatomic) IBOutlet UILabel *team2;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *score1;
@property (strong, nonatomic) IBOutlet UILabel *score2;
@property (strong, nonatomic) IBOutlet UILabel *status;



@end
