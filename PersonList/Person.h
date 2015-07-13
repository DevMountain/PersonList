//
//  Person.h
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *job;

// For testing only
+ (NSArray *)allTheFakePeople;

@end
