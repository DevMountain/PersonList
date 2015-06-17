//
//  PersonController.h
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonController : NSObject

@property (nonatomic, strong, readonly) NSArray *personList;

+ (PersonController *)sharedInstance;

- (void)addPerson:(Person *)person;
- (void)removePerson:(Person *)person;


@end
