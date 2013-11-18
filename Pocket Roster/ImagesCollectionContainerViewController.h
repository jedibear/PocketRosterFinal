//
//  ImagesCollectionContainerViewController.h
//  Pocket Roster
//
//  Created by James P. Garvey on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagesCollectionContainerViewController : UIViewController

@property (nonatomic) BOOL *imagesLoaded;
@property (nonatomic) NSMutableArray *pictures;
@property (nonatomic) NSString *incommingURL, *albumTitle;

@end
