//
//  Person.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Person.h"

static NSString * const imageNameKey = @"imageName";
static NSString * const nameKey = @"name";
static NSString * const phoneNumberKey = @"phoneNumber";
static NSString * const jobKey = @"job";

@implementation Person

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.imageName = dictionary[imageNameKey];
        self.name = dictionary[nameKey];
        self.phoneNumber = dictionary[phoneNumberKey];
        self.job = dictionary[jobKey];
    }
    return self;
}

- (NSDictionary *)personDictionary {
    
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.name) {
        [entryDictionary setObject:self.name forKey:nameKey];
    }
    if (self.imageName) {
        [entryDictionary setObject:self.imageName forKey:imageNameKey];
    }
    if (self.phoneNumber) {
        [entryDictionary setObject:self.phoneNumber forKey:phoneNumberKey];
    }
    if (self.job) {
        [entryDictionary setObject:self.job forKey:jobKey];
    }
    
    return entryDictionary;
    
}

- (NSString *)description {
    return self.name;
}

+ (NSArray *)allTheFakePeople {
    
    return @[
             @{imageNameKey: @"1",
               nameKey: @"Some Dude",
               phoneNumberKey: @"888-888-8888",
               jobKey: @"Garbage Collection"},
             @{imageNameKey: @"2",
               nameKey: @"Chris Sacca",
               phoneNumberKey: @"920-558-1033",
               jobKey: @"Venture Capitalist"},
             @{imageNameKey: @"3",
               nameKey: @"The Real Programmer",
               phoneNumberKey: @"444-444-4444",
               jobKey: @"iOS Development"},
             @{imageNameKey: @"4",
               nameKey: @"Your Mom",
               phoneNumberKey: @"556-243-1089",
               jobKey: @"Web Development"},
             ];
}

@end
