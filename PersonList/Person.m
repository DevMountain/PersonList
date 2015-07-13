//
//  Person.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Person.h"

static NSString * const ImageNameKey = @"imageName";
static NSString * const NameKey = @"name";
static NSString * const PhoneNumberKey = @"phoneNumber";
static NSString * const JobKey = @"job";

@implementation Person

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [self init];
	if (self) {
		self.imageName = [coder decodeObjectForKey:ImageNameKey];
		self.name = [coder decodeObjectForKey:NameKey];
		self.phoneNumber = [coder decodeObjectForKey:PhoneNumberKey];
		self.job = [coder decodeObjectForKey:JobKey];
	}
	return self;
}
    
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if (self.imageName) [aCoder encodeObject:self.imageName forKey:ImageNameKey];
	if (self.name) [aCoder encodeObject:self.name forKey:NameKey];
	if (self.phoneNumber) [aCoder encodeObject:self.phoneNumber forKey:PhoneNumberKey];
	if (self.job) [aCoder encodeObject:self.job forKey:JobKey];
}

#pragma mark -

- (NSString *)description {
    return self.name;
}

+ (NSArray *)allTheFakePeople {

	Person *person1 = [[Person alloc] init];
	person1.imageName = @"1";
	person1.name = @"Some Dude";
	person1.phoneNumber = @"888-888-8888";
	person1.job = @"Garbage Collection";
	Person *person2 = [[Person alloc] init];
	person2.imageName = @"2";
	person2.name = @"Chris Sacca";
	person2.phoneNumber = @"920-558-1033";
	person2.job = @"Venture Capitalist";
	Person *person3 = [[Person alloc] init];
	person3.imageName = @"3";
	person3.name = @"The Real Programmer";
	person3.phoneNumber = @"444-444-4444";
	person3.job = @"iOS Development";
	Person *person4 = [[Person alloc] init];
	person4.imageName = @"4";
	person4.name = @"Your Mom";
	person4.phoneNumber = @"556-243-1089";
	person4.job = @"Web Development";
	return @[person1, person2, person3, person4];
}

@end
