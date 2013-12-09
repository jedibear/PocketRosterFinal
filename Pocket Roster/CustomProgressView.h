//
//  CustomProgressView.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/14/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CustomProgressView : UIView{
    float current_val, new_val;
    id delegate;
    UILabel *progressLabel, *progressStatus;
    UIImageView *centerImage;
    BOOL *annimationIsInProgress;
}

@property id delegate;
@property float current_val;

- (id) init;
- (void) setProgress: (NSNumber *)value;

@end

@protocol CustomProgressViewDelegate



@end