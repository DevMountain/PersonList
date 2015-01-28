//
//  PersonTableViewCell.h
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonTableViewCell : UITableViewCell

- (void)updateWithPerson:(Person *)person;

@end
