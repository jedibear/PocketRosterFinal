//
//  RSSTVC.h
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WebViewController.h"

@interface RSSTVC : UITableViewController <NSXMLParserDelegate>


@property (nonatomic) NSMutableArray *stories;
@property (nonatomic) NSMutableDictionary * item;
@property (nonatomic) NSMutableString *currentTitle, *currentDate, *currentSummary, *currentLink, *imageURL, *sequeLink;
@property (nonatomic) NSString *currentElement, *teamName, *incommingURL;
@property (nonatomic) UIImage *storyImage;

@property (nonatomic) NSString *backgroundImagePath, *incommingTeamURL;
@property (nonatomic) NSString *newsURL;
@property (nonatomic) BOOL *longForm;



- (void) setTeamName:(NSString *)teamName;



@end
