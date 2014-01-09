//
//  ScoreboardTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/15/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ScoreboardTVC.h"
#import "GetScoreBoard.h"
#import "ScoreboardCell.h"

@interface ScoreboardTVC ()

@end

@implementation ScoreboardTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.load startAnimating];

}
- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    
    self.incommingScheduleURL = @"http://athletics.bowdoin.edu/landing/index";
    
    self.scoreboard = [[NSMutableDictionary alloc]init];
    self.scoreboard = [GetScoreBoard getTheScoreBoard:self.incommingScheduleURL];
    
    [self.load stopAnimating];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];

    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];
    [self.tableView reloadData];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) refresh: (UIRefreshControl *)sender{
    
    sender.attributedTitle = [[NSAttributedString alloc]initWithString:@"Refreshing Scoreboard..."];
    
    self.scoreboard = [GetScoreBoard getTheScoreBoard:@"http://athletics.bowdoin.edu/landing/index"];
    
    [self.tableView reloadData];
    
    [(UIRefreshControl *)sender endRefreshing];
    
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
    return [self.scoreboard count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ScoreboardCell";
    ScoreboardCell *cell = (ScoreboardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSString *key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
    
    // Configure the cell...
    
    
    
    
    NSMutableDictionary *contestObjects = [self.scoreboard objectForKey:key];
    
    
    cell.sportLabel.text = [contestObjects objectForKey:@"sport"];
    cell.team1.text = [contestObjects objectForKey:@"team1"];
    cell.team2.text = [contestObjects objectForKey:@"team2"];
    cell.date.text = [contestObjects objectForKey:@"date"];
    cell.score1.text = [contestObjects objectForKey:@"score1"];
    cell.score2.text = [contestObjects objectForKey:@"score2"];
    cell.status.text = [contestObjects objectForKey:@"status"];
    
    
    
    return cell;
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
