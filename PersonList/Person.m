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

// Helper method that creates dictionary representation of a Person object in order to be stored to NSUserDefaults
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

@end
