//
//  RecordsViewController.m
//  fsgdfg
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import "RecordsViewController.h"
#import "RecordsTVC.h"

@interface RecordsViewController ()

@end

@implementation RecordsViewController

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

//segue for embeded coaches TVC
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"embedRecords"]) {
        if ([segue.destinationViewController isKindOfClass:[RecordsTVC class]]) {
            RecordsTVC *rTVC = (RecordsTVC *)segue.destinationViewController;
            rTVC.recordsURL = self.recordsURL;
        }
    }
}

@end
