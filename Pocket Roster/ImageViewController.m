//
//  ImageViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

/*
 *  For the next update: swiping left or right should pull up the next photo
 *  and display in the zoomed format
 *
 */
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
	
    self.zoomedImage.image = self.incImage;
    self.zoomedImage.center = self.view.center;
    
    self.zoomedImage.contentMode = UIViewContentModeScaleAspectFit;
    
    CGRect frame = self.zoomedImage.frame;
    frame.size.width = 340;
    frame.origin.x = self.view.frame.size.width/2 - 170;
    frame.origin.y = self.view.frame.size.height/2 - frame.size.height/2;

    self.zoomedImage.image = self.incImage;
    self.zoomedImage.frame = frame;

    
    
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
            ImagesCollectionContainerViewController *rAVC = (ImagesCollectionContainerViewController *)segue.destinationViewController;
            
            
            rAVC.imageURL = self.imageURL;
            rAVC.incAlbum = self.incAlbum;
            
            rAVC.incommingURL = self.incommingURL;
            rAVC.incommingTeamURL= self.incommingTeamURL;
            rAVC.backgroundImagePath = self.backgroundImagePath;
            rAVC.teamName = self.teamName;
            rAVC.haveRoster = self.haveRoster;
            rAVC.longForm = self.longForm;
            
            rAVC.teamRoster = self.teamRoster;
            rAVC.stories = self.stories;
            rAVC.coaches = self.coaches;
            rAVC.albums = self.albums;
            rAVC.haveNews = self.haveNews;
            rAVC.haveCoaches = self.haveCoaches;
            rAVC.haveAlbums = self.haveAlbums;
            
            rAVC.imageBackground = self.imageBackground;
            rAVC.schedBackground = self.schedBackground;
        }
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
