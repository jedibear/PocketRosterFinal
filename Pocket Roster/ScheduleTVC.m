//
//  ScheduleTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 4/24/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ScheduleTVC.h"
#import "ScheduleCell.h"
#import "GetSchedule.h"
#import "ScheduleViewController.h"

@interface ScheduleTVC ()

@end

@implementation ScheduleTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSMutableDictionary*) scheduleInfo{
    
    if(!_scheduleInfo){
        _scheduleInfo = [[NSMutableDictionary alloc] init];
    }
    return _scheduleInfo;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.load startAnimating];
   
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    
    self.scheduleInfo = [GetSchedule getSchedule:self.schedURL];
    
    [self.load stopAnimating];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.scheduleInfo count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ScheduleCell";
    ScheduleCell *cell = (ScheduleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    self.key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
    
    NSArray* contestObjects = [self.scheduleInfo objectForKey:self.key];
    
    
    // Configure the cell...
    
    if([contestObjects objectAtIndex:0] != nil){
        NSString *date = [[NSString alloc] initWithFormat:@"%@", [contestObjects objectAtIndex:0]];
        
        NSString *opponent = [[NSString alloc] initWithFormat:@"%@", [contestObjects objectAtIndex:1]];
        NSString *result = [[NSString alloc] initWithFormat:@"%@", [contestObjects objectAtIndex:2]];
        NSString *time = [[NSString alloc] initWithFormat:@"%@", [contestObjects objectAtIndex:3]];
        
        cell.dateOfContest.text = date;
        
        cell.opponentName.text = opponent;
        cell.result.text = result;
        cell.time.text = time;
        
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
