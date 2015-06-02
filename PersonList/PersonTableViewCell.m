//
//  PersonTableViewCell.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PersonTableViewCell.h"

@interface PersonTableViewCell ()

// Properties all wired up to storyboard prototype cell
@property (nonatomic, strong) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *phoneLabel;
@property (nonatomic, strong) IBOutlet UILabel *jobLabel;

@end

@implementation PersonTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

// Configures cell labels/image from the Person object's properties
- (void)updateWithPerson:(Person *)person {
    
    self.avatarImageView.image = [UIImage imageNamed:person.imageName];
    self.nameLabel.text = person.name;
    self.phoneLabel.text = person.phoneNumber;
    self.jobLabel.text = person.job;
    
}

@end
