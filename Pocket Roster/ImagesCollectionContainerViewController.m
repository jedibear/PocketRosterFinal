//
//  ImagesCollectionContainerViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ImagesCollectionContainerViewController.h"
#import "CollectionImageViewController.h"
#import "GetImages.h"

@interface ImagesCollectionContainerViewController ()

@end

@implementation ImagesCollectionContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"embedPhotos"]) {
        if ([segue.destinationViewController isKindOfClass:[CollectionImageViewController class]]) {
            CollectionImageViewController *cVC = (CollectionImageViewController *)segue.destinationViewController;
            
            cVC.incommingURL = self.incommingURL;
            cVC.pictures = self.pictures;
            cVC.imagesLoaded = self.imagesLoaded;
            
        }
    }
}

@end
