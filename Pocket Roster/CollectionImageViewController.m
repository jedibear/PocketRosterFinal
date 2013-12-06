//
//  CollectionImageViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "CollectionImageViewController.h"
#import "ImageCollectionCell.h"
#import "ImageViewController.h"
#import "GetImages.h"

@interface CollectionImageViewController ()

@end

@implementation CollectionImageViewController

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

    //NSLog(@"%@ bada-bing", self.incAlbum);
    [self.load startAnimating];
    
    
	// Do any additional setup after loading the view.
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    
    
    if (self.haveAlbums) {
        NSLog(@"yup containerVC");
    }
    
    if(![[self.incAlbum objectForKey:@"picturesLoaded"]isEqualToString:@"YES"]){
        NSString *havePictures = @"YES";
        [self.incAlbum setObject:[GetImages getMostRecentImages:self.imageURL] forKey:@"pictures"];
        [self.incAlbum setObject:havePictures forKey:@"picturesLoaded"];
        
        [self.albums setObject:self.incAlbum forKey:self.saveKey];
        //NSLog(@"inside %@", [self.incAlbum objectForKey:@"picturesLoaded"]);
    }
    
    [self.load stopAnimating];
    [self.collectionView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [[self.incAlbum objectForKey:@"pictures"] count]-1;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCollectionCell *cell = (ImageCollectionCell *)[cv dequeueReusableCellWithReuseIdentifier:@"ImageCCell" forIndexPath:indexPath];
    
    
    cell.cellImage.image = [[self.incAlbum objectForKey:@"pictures"] objectAtIndex:[indexPath row]];
    
    return cell;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[ImageCollectionCell class]]) {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        
        if(indexPath){
            
            if ([segue.identifier isEqualToString:@"zoomPhoto"]) {
                if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
                    
                    ImageViewController *rAVC = (ImageViewController *)segue.destinationViewController;
                    
                    rAVC.incImage = [[self.incAlbum objectForKey:@"pictures"] objectAtIndex:[indexPath row]];
                    rAVC.incAlbum= self.incAlbum;
                    rAVC.imageURL = self.imageURL;
                    
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
    }
}

@end
