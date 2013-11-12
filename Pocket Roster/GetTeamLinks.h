//
//  GetTeamLinks.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 10/23/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetTeamLinks : NSObject

+(NSMutableArray *) getTeamLinkBreakdown:(NSString *)incommingURL;

@end
