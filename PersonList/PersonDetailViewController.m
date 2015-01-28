//
//  PersonDetailViewController.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PersonDetailViewController.h"

@interface PersonDetailViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *phoneLabel;
@property (nonatomic, strong) IBOutlet UILabel *jobLabel;

@property (nonatomic, strong) Person *person;

@end

@implementation PersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateDetails];

}

- (void)updateWithPerson:(Person *)person {
    
    self.person = person;
    
    [self updateDetails];
    
}

- (void)updateDetails {

    self.imageView.image = [UIImage imageNamed:self.person.imageName];
    self.nameLabel.text = self.person.name;
    self.phoneLabel.text = self.person.phoneNumber;
    self.jobLabel.text = self.person.job;

}


@end
