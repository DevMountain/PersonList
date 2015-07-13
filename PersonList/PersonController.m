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
    });
    return sharedInstance;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self loadPersonListFromDisk];
	}
	return self;
}

// Adds Person to personList array
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

#pragma mark - Save / Load

+ (NSURL *)saveFileURL {
	NSFileManager *fm = [NSFileManager defaultManager];
	NSURL *result = [[fm URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] firstObject];
	NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
	result = [result URLByAppendingPathComponent:bundleID];
	
	if (![fm fileExistsAtPath:[result path]]) {
		[fm createDirectoryAtURL:result withIntermediateDirectories:YES attributes:nil error:NULL];
	}
	
	result = [result URLByAppendingPathComponent:@"people"];
	return result;
}

- (void)save
{
	NSURL *fileURL = [[self class] saveFileURL];
	[NSKeyedArchiver archiveRootObject:self.personList toFile:[fileURL path]];
}

- (void)loadPersonListFromDisk
{
	NSURL *fileURL = [[self class] saveFileURL];
	if (![[NSFileManager defaultManager] fileExistsAtPath:[fileURL path]]) { // File doesn't exist
		self.personList = [[NSArray alloc] init];
		return;
	}
	
	self.personList = [[NSKeyedUnarchiver unarchiveObjectWithFile:[fileURL path]] mutableCopy];
}


@end
