//
//  CoachesTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import "CoachesTVC.h"
#import "GetCoaches.h"
#import "CoachesCell.h"
#import "CoachesBioViewController.h"

@interface CoachesTVC ()

@end

@implementation CoachesTVC

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

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(!self.haveCoaches){
        self.coaches = [GetCoaches getCoaches:self.coachesURL];
        self.haveCoaches = YES;
    }
    
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
    return [self.coaches count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CoachesCell";
    CoachesCell *cell = (CoachesCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]];
    
    NSMutableDictionary *details = [self.coaches objectForKey:key];
    
    cell.coachesName.text = [details objectForKey:@"name"];
    cell.coachPic.image = [details objectForKey:@"image"];
    cell.coachesPosition.text = [details objectForKey:@"position"];
    
    // Configure the cell...
    
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        //RosterCell *cell = sender;
        if(indexPath){
            
            if ([segue.identifier isEqualToString:@"coachBio"]) {
                if ([segue.destinationViewController isKindOfClass:[CoachesBioViewController class]]) {
                    
                    CoachesBioViewController *rAVC = (CoachesBioViewController *)segue.destinationViewController;
                    
                    NSString *key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]];
                    NSMutableDictionary *athleteObjects = [self.coaches objectForKey:key];
                    
                    
                    rAVC.athleteName = [athleteObjects objectForKey:@"name"];
                    
                    
                    
                    rAVC.bio = athleteObjects;
                    rAVC.athleteImageInput = [athleteObjects objectForKey:@"image"];
                    rAVC.incommingURL = self.coachesURL;
                    rAVC.haveRoster = self.haveRoster;
                    rAVC.teamRoster = self.teamRoster;
                    rAVC.teamName = self.teamName;
                    rAVC.longForm = self.longForm;
                    rAVC.incommingTeamURL = self.incommingTeamURL;
                    rAVC.backgroundImagePath = self.backgroundImagePath;
                    
                    rAVC.stories = self.stories;
                    rAVC.coaches = self.coaches;
                    rAVC.albums = self.albums;
                    rAVC.haveNews = self.haveNews;
                    rAVC.haveCoaches = self.haveCoaches;
                    rAVC.haveAlbums = self.haveAlbums;
                    
                    rAVC.schedBackground = self.schedBackground;
                    rAVC.imageBackground = self.imageBackground;
                }
            }
            
        }
    }
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
