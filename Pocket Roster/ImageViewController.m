//
//  ImageViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//
#import "ImageViewController.h"
#import "ImagesCollectionContainerViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *titleBarButtonItem;

@end

@implementation ImageViewController

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
    [self.zoomedImage setImage:self.incImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"back2Albums"]) {
        if ([segue.destinationViewController isKindOfClass:[ImagesCollectionContainerViewController class]]) {
            ImagesCollectionContainerViewController *asc = (ImagesCollectionContainerViewController *)segue.destinationViewController;
            
            asc.imagesLoaded = self.imagesLoaded;
            asc.pictures = self.pictures;
            asc.incommingURL = self.incommingURL;
            
        }
    }
}
@end
