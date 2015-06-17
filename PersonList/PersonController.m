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

// Adds Person to personList array
- (void)addPerson:(Person *)person {
    
    if (!person) {
        return;
    }
    
    // Creates temporary mutable array to add person
    NSMutableArray *mutablePersonList = [[NSMutableArray alloc] initWithArray:self.personList];
    [mutablePersonList addObject:person];
    
    self.personList = mutablePersonList;
}

// Removes Person to personList array
- (void)removePerson:(Person *)person {
    
    if (!person) {
        return;
    }
    
    // Creates temporary mutable array to remove person
    NSMutableArray *mutablePersonList = self.personList.mutableCopy;
    [mutablePersonList removeObject:person];
    
    self.personList = mutablePersonList;
}

// Returns array of all Person objects stored in NSUserDefaults
+ (NSMutableArray *)loadPersonListFromDefaults {
    
    NSArray *personDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:personListKey];
    
    NSMutableArray *personList = [NSMutableArray new];
    
    // Loops through array of dictionaries in defaults, converts each to Person object
    for (NSDictionary *personDictionary in personDictionaries) {
        Person *person = [[Person alloc] initWithDictionary:personDictionary];
        [personList addObject:person];
    }
    
    return personList;
}

// Stores array of all Person objects to NSUserDefaults
+ (void)storePersonListInDefaults:(NSArray *)personList {
    
    NSMutableArray *personDictionaries = [NSMutableArray new];
    
    // Loops through array of Person objects, adds dictionary representation of each Person to array
    for (Person *person in personList) {
        [personDictionaries addObject:[person personDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:personDictionaries forKey:personListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
