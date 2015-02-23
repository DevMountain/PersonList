//
//  PersonDetailViewController.h
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface PersonDetailViewController : UIViewController

@property (nonatomic, weak) Person *person;

@end
