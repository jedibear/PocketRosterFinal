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
    if(!self.imagesLoaded){
        self.pictures = [GetImages getMostRecentImages:self.incommingURL];
        self.imagesLoaded = YES;
        
    }
	// Do any additional setup after loading the view.
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [self.pictures count]-1;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCollectionCell *cell = (ImageCollectionCell *)[cv dequeueReusableCellWithReuseIdentifier:@"ImageCCell" forIndexPath:indexPath];
    
    
    cell.cellImage.image = [self.pictures objectAtIndex:[indexPath row]];
    
    return cell;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[ImageCollectionCell class]]) {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        
        if(indexPath){
            
            if ([segue.identifier isEqualToString:@"zoomPhoto"]) {
                if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
                    
                    ImageViewController *rAVC = (ImageViewController *)segue.destinationViewController;
                    
                    rAVC.incImage = [self.pictures objectAtIndex:[indexPath row]];
                    rAVC.imagesLoaded = self.imagesLoaded;
                    rAVC.pictures = self.pictures;
                    
                }
            }
            
        }
    }
}

@end
