//
//  PersonListTableViewController.m
//  PersonList
//
//  Created by Joshua Howland on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PersonListTableViewController.h"
#import "PersonListTableViewDataSource.h"

@interface PersonListTableViewController ()

@property (nonatomic, strong) IBOutlet PersonListTableViewDataSource *dataSource;

@end

@implementation PersonListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.dataSource = [PersonListTableViewDataSource new];
//    self.tableView.dataSource = self.dataSource;

}

@end
