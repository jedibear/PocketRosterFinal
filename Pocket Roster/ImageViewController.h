//
//  ImageViewController.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property (nonatomic, strong) NSString *incommingURL;
@property (strong, nonatomic) IBOutlet UIImageView *zoomedImage;
@property (nonatomic) UIImage *incImage;
@property (nonatomic) BOOL *imagesLoaded;

@property (nonatomic) NSMutableArray *pictures;

@end
