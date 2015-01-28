//
//  PersonController.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PersonController.h"

static NSString * const personListKey = @"personList";

@interface PersonController ()

@property (nonatomic, strong) NSArray *personList;

@end

@implementation PersonController

+ (PersonController *)sharedInstance {
    static PersonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PersonController alloc] init];
        
        sharedInstance.personList = [PersonController loadPersonListFromDefaults];
    });
    return sharedInstance;
}

- (void)addPerson:(Person *)person {
    
    if (!person) {
        return;
    }
    
    NSMutableArray *mutablePersonList = [[NSMutableArray alloc] initWithArray:self.personList];
    [mutablePersonList addObject:person];
    
    self.personList = mutablePersonList;
}

- (void)removePerson:(Person *)person {
    
    if (!person) {
        return;
    }
    
    NSMutableArray *mutablePersonList = self.personList.mutableCopy;
    [mutablePersonList removeObject:person];
    
    self.personList = mutablePersonList;
    
}


+ (NSMutableArray *)loadPersonListFromDefaults {
    
    NSArray *personDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:personListKey];
    
    NSMutableArray *personList = [NSMutableArray new];
    
    for (NSDictionary *personDictionary in personDictionaries) {
        Person *person = [[Person alloc] initWithDictionary:personDictionary];
        [personList addObject:person];
    }
    
    return personList;
}

+ (void)storePersonListInDefaults:(NSArray *)personList {
    
    NSMutableArray *personDictionaries = [NSMutableArray new];
    
    for (Person *person in personList) {
        [personDictionaries addObject:[person personDictionary]];
    }
    
    
    [[NSUserDefaults standardUserDefaults] setObject:personDictionaries forKey:personListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
