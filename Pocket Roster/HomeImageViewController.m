//
//  HomeImageViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "HomeImageViewController.h"
#import "HomeImageTVC.h"
#import "GetImages.h"

@interface HomeImageViewController ()

@end

@implementation HomeImageViewController

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
    
    if([segue.identifier isEqualToString:@"embedAlbums"]){
        
        if([segue.destinationViewController isKindOfClass:[HomeImageTVC class]]){
            HomeImageTVC *hTVC = (HomeImageTVC *)segue.destinationViewController;
            
            hTVC.inputURL = self.incommingURL;
        }
    }
    
}



@end
