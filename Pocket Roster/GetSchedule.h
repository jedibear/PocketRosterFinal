//
//  GetSchedule.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/10/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetSchedule : NSObject

+(NSMutableDictionary *) getSchedule: (NSString *) linkForURLSearch;
//This method is just for testing while I can push
//+(void) getSchedule;

@end